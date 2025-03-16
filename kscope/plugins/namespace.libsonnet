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
        
        onCreateScopeObjects: function(state, parameters, scope)
            if std.objectHas(parameters, 'createNamespace')
            then
                local ns = scope.exportApi('v1', 'Namespace');
                local field = std.get(parameters, 'createNamespaceField', 'namespace');
                {
                    [field]: ns.new(state.namespace) + ns.applyDefaults()
                }
            else { },

        onEnterScope: function(state, parameters)
            if std.objectHas(parameters, 'namespace') && std.objectHas(parameters, 'createNamespace') then
                error "Cannot specify scope parameters 'namespace' and 'createNamespace' at the same time"
            else if std.objectHas(parameters, 'namespace') then
                state { namespace: parameters.namespace, createNamespace: false }
            else if std.objectHas(parameters, 'createNamespace') then
                local createNamespaceParameter = std.get(parameters, 'createNamespace');
                state { namespace: createNamespaceParameter, createNamespace: true }
            else
                state { createNamespace: false },
        
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
            local isObject = utils.isKubernetesObject(object);
            local isNamespace = isObject && object.apiVersion == 'v1' && object.kind == 'Namespace';
            local isNamespaced = 
                if !isObject then false
                else if isNamespace then true
                else utils.toBoolean(utils.rGet(object, ['metadata', 'annotations', 'tanka.dev/namespaced'], true)
            );
            local hasNamespace = 
                if !isObject then false
                else if isNamespace then object.metadata.name
                else utils.rObjectHas(object, ['metadata', 'namespace']);
            local assignedNamespace = utils.rGet(object, ['metadata', 'namespace'], 'default');
            if !isNamespaced then
                if std.get(parameters, 'onlyNamespaced', false)
                then { }
                else if hasNamespace && filterNamespace != null && filterNamespace != assignedNamespace
                then { }
                else if hasNamespace
                then object + std.prune({ metadata: std.get(object, 'metadata', { }) + { namespace: null } })
                else object
            else if filterNamespace == null || filterNamespace == assignedNamespace
            then object
            else { }
    }
}