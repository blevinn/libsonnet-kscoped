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
    }
}