local normalizeApp(app) =
    if std.isString(app) then
        normalizeApp({ name: app })
    else if !std.isObject(app) then 
        error 'unexpected app specification of type ' + std.type(app)
    else {
        name: std.get(app, 'name', error 'missing app name'),
        component: std.get(app, 'component'),
        instance:
            if std.objectHas(app, 'instance') then
                std.join('-', [self.name, app.instance])
            else
                self.name,
        partOf: std.get(app, 'partOf', self.name),
        version: std.get(app, 'version'),
    };

local stateLabelMap = {
    name: 'app.kubernetes.io/name',
    instance: 'app.kubernetes.io/instance',
    partOf: 'app.kubernetes.io/part-of',
    version: 'app.kubernetes.io/version',
    component: 'app.kubernetes.io/component',
};

{
    metadata: {
        id: 'https://github.com/blevinn/libsonnet-kscoped/kscope/plugins/app-labels.libsonnet',
        name: 'app-labels',
    },
    hooks: {
        onApplyDefaults: function(state, parameters, api, kind, class)
            if !std.objectHas(std.get(class, 'metadata', { }), 'withLabelsMixin')
                || state == { }
            then
                { }
            else
                class.metadata.withLabelsMixin({
                    [if std.get(state, kv.key) != null then kv.value]: state[kv.key]
                    for kv in std.objectKeysValues(stateLabelMap)
                }),

        onEnterScope: function(state, parameters)
            if std.objectHas(parameters, 'app') then
                if std.objectHas(parameters, 'childApp') then
                    error 'cannot simultaneous specify app and child app'
                else 
                    state + normalizeApp(parameters.app)
            else if std.objectHas(parameters, 'childApp') then
                local parent = std.get(state, 'name', error 'unexpected child without parent');
                state + normalizeApp(parameters.childApp + { partOf: parent })
            else
                state,
    }
}
