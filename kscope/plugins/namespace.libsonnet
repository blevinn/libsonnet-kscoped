local utils = import '../utils.libsonnet';

{
    metadata: {
        id: 'https://github.com/blevinn/libsonnet-kscoped/kscope/plugins/namespace.libsonnet',
        name: 'namespace',
    },
    hooks: {
        onApplyDefaults: function(state, parameters, api, kind, class)
            if std.objectHas(state, 'namespace')
               && std.objectHas(std.get(class, 'metadata', { }), 'withNamespace')
            then
                class.metadata.withNamespace(state.namespace)
            else
                { },

        onEnterScope: function(state, parameters)
            if std.objectHas(parameters, 'namespace') then
                state { namespace: parameters.namespace }
            else
                state,
        
        onExportApi: function(state, api, kind, class)
            if std.objectHas(std.get(class, 'metadata', { }), 'withNamespace')
            then class {
                metadata+: {
                    withNamespace(namespace):
                        if std.isObject(namespace)
                           && std.get(namespace, 'apiVersion') == 'v1'
                           && std.get(namespace, 'kind') == 'Namespace'
                        then
                            class.metadata.withNamespace(namespace.metadata.name)
                        else
                            class.metadata.withNamespace(namespace)
                }
            }
            else class,
        
        onFilterObject: function(object, state, parameters)
            local filterNamespace = std.get(parameters, 'namespace');
            local isNamespace = object.apiVersion == 'v1' && object.kind == 'Namespace';
            local isNamespaced = isNamespace || utils.toBoolean(utils.rGet(object, ['metadata', 'annotations', 'tanka.dev/namespaced'], true));
            local hasNamespace = 
                if isNamespace then object.metadata.name
                else utils.rObjectHas(object, ['metadata', 'namespace']);
            local assignedNamespace = utils.rGet(object, ['metadata', 'namespace'], 'default');
            if !isNamespaced then
                if std.get(parameters, 'onlyNamespaced', false)
                then { }
                else if hasNamespace && filterNamespace != null && filterNamespace != assignedNamespace
                then { }
                else if hasNamespace
                then std.prune(object + { metadata+: { namespace: null } })
                else object
            else if filterNamespace == null || filterNamespace == assignedNamespace
            then object
            else { }
    }
}