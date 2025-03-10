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
            else class
    }
}