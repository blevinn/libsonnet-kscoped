local utils = import './utils.libsonnet';

local util =
  local _firstOrDefault(arr, default=null, filter=function(item) true) =
    if !std.isArray(arr) then
      error 'expected array'
    else if std.length(arr) == 0 then
      default
    else if filter(arr[0]) then
      arr[0]
    else
      _firstOrDefault(arr[1:], default, filter);

  {
    firstOrDefault: _firstOrDefault,
  };

local emptyScope = {};

local loadPlugin(plugin) = {
  hooks: {
    onApplyDefaults(state, parameters, api, kind, class):
      local f = utils.rGet(plugin, 'hooks.onApplyDefaults', function(s, p, a, k, c) {});
      f(state, parameters, api, kind, class),
    onEnterScope(state, parameters):
      local f = utils.rGet(plugin, 'hooks.onEnterScope', function(s, p) s);
      f(state, parameters),
    onExportApi(state, api, kind, class):
      local f = utils.rGet(plugin, 'hooks.onExportApi', function(s, a, k, c) c);
      f(state, api, kind, class),
    onFilterObject(object, state, parameters):
      local f = utils.rGet(plugin, 'hooks.onFilterObject', function(o, s, p) o);
      f(object, state, parameters),
    onFilterScope(state, parameters):
      local f = utils.rGet(plugin, 'hooks.onFilterScope', function(s, p) true);
      f(state, parameters),
  },
  metadata: {
    id: utils.rGet(plugin,
                       'metadata.id',
                       error 'plugin must have an id'),
    name: utils.rGet(plugin, 'metadata.name', self.id),
    description: utils.rGet(plugin, 'metadata.description', ''),
  },
  state: {},
};

local privateAccess(scope) = {
  aliases: {
    add(alias, api, kind):
      privateAccess(scope { aliases+: { [alias]: { api: api, kind: kind } } }),
    clear(): privateAccess(scope { aliases: {} }),
    get(alias): std.get($.aliases.list(), alias),
    list(): std.get(scope, 'aliases', {}),
    remove(alias):
      local result = scope {
        aliases: {
          [kv.key]: kv.value
          for kv in std.objectKeysValues($.aliases.list())
          if kv.key != alias
        },
      };
      privateAccess(scope),
  },
  apis: {
    add(name, api):
      local result = scope {
        apis+: {
          [name]: api,
        },
      };
      privateAccess(result),
    clear(): privateAccess(scope { apis: {} }),
    get(api): std.get($.apis.list(), api),
    getClass(api, kind): utils.rGet($.apis.list(), [api, kind]),
    list(): std.get(scope, 'apis', {}),
    remove(api):
      local result = scope {
        apis: {
          [kv.key]: kv.value
          for kv in std.objectKeysValues($.apis.list())
          if kv.key != api
        },
      };
      privateAccess(result),
  },
  filter: {
    set(filter):
      local result = scope {
        filter: filter,
      };
      privateAccess(result),
    get(): std.get(scope, 'filter', {}),
  },
  plugins: {
    add(plugin, metadata={}):
      local _metadata =
        if std.isString(metadata) then
          { id: metadata }
        else if std.isObject(metadata) then
          metadata
        else
          error 'metadata must be a string or object';
      local result = scope {
        plugins+: [
          loadPlugin(plugin) + { metadata: _metadata },
        ],
      };
      privateAccess(result),

    clear(): privateAccess(scope { plugins: [] }),
    executeHooks: {
      applyDefaults(parameters, api, kind, class):
        local executeOne(aggObject, plugin) =
          aggObject
          + plugin.hooks.onApplyDefaults(plugin.state, parameters, api, kind, class);
        std.foldl(executeOne, $.plugins.list(), {}),
      onEnterScope(parameters):
        local result = scope {
          plugins: [
            p { state: p.hooks.onEnterScope(p.state, parameters) }
            for p in $.plugins.list()
          ],
        };
        privateAccess(result),
      onExportApi(api, kind, class):
        local executeOne(aggClass, plugin) =
          plugin.hooks.onExportApi(plugin.state, api, kind, aggClass);
        std.foldl(executeOne, $.plugins.list(), class),
      onFilterObject(object):
        local executeOne(aggObject, plugin) =
          plugin.hooks.onFilterObject(aggObject, plugin.state, $.filter.get());
        std.foldl(executeOne, $.plugins.list(), object),
      onFilterScope():
        local executeOne(plugin) =
          plugin.hooks.onFilterScope(plugin.state, $.filter.get());
        std.all(std.map(executeOne, $.plugins.list())),
    },
    get(id): util.firstOrDefault($.plugins.list(), filter=function(item) item.metadata.id == id),
    list(): std.get(scope, 'plugins', []),
    remove(id):
      local result = scope {
        plugins: [p for p in $.plugins.list() if p.metadata.id != id],
      };
      privateAccess(result),
  },
};

local publicAccess(private) = {
  listApis(): private.apis.list(),

  enterScope(params, f):
    local newScope = private.plugins.executeHooks.onEnterScope(params);
    if newScope.plugins.executeHooks.onFilterScope() then
        utils.walk(f(publicAccess(newScope)),
            {
                objectEntry: function(stack, object)
                    if utils.isKubernetesObject(object)
                    then private.plugins.executeHooks.onFilterObject(object)
                    else object,
                objectRecurse: function(stack, object) !utils.isKubernetesObject(object)
            })
    else { },

  exportApi(api, kind):
    local base = private.apis.getClass(api, kind);
    local withPlugins = private.plugins.executeHooks.onExportApi(api, kind, base);
    withPlugins {
      applyDefaults(params={}):
        private.plugins.executeHooks.applyDefaults(params, api, kind, withPlugins),
    },
} + {
  [kv.key]: super.exportApi(kv.value.api, kv.value.kind)
  for kv in std.objectKeysValues(private.aliases.list())
};

{
  configuration: {
    addPlugin(plugin): {
      plugins+: [
        plugin,
      ],
    },

    alias(name, api, kind): {
      aliases+: {
        [name]: { api: api, kind: kind },
      },
    },

    api(name, api): {
      apis+: {
        [name]: api,
      },
    },

    apis(api):
      local addApi(agg, kv) =
        agg + $.configuration.api(kv.key, kv.value);
      std.foldl(addApi, std.objectKeysValuesAll(api), {}),
    
    filter(filter): {
      filter: filter
    },

    filterMixin(filter): {
      filter+: filter
    }
  },

  use(config):
    local baseScope = privateAccess(emptyScope);
    local withFilter = baseScope.filter.set(std.get(config, 'filter', {}));
    local addPlugin(aggScope, plugin) =
      aggScope.plugins.add(plugin);
    local withPlugins = std.foldl(addPlugin, std.get(config, 'plugins', []), withFilter);
    local addAlias(aggScope, kvAlias) =
      aggScope.aliases.add(kvAlias.key, kvAlias.value.api, kvAlias.value.kind);
    local withAliases = std.foldl(addAlias, std.objectKeysValues(std.get(config, 'aliases', {})), withPlugins);
    local addApi(aggScope, kvApi) =
      aggScope.apis.add(kvApi.key, kvApi.value);
    local withApis = std.foldl(addApi, std.objectKeysValues(std.get(config, 'apis', {})), withAliases);

    publicAccess(withApis),
}
