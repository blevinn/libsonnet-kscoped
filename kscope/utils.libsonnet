local _rGet(o, fields, default = null) = 
    if std.isString(fields) then
        _rGet(o, std.split(fields, '.'), default)
    else if std.isArray(fields) then
        if std.length(fields) == 0 then
            error 'cannot get value with empty fields'
        else if std.length(fields) == 1 then
            {
                exists: std.objectHas(o, fields[0]),
                value: std.get(o, fields[0], default)
            }
        else if !std.objectHas(o, fields[0]) then
            {
                exists: false,
                value: default
            }
        else
            _rGet(o[fields[0]], fields[1:], default)
    else
        error 'fields must be a string or an array';

local walk(o, hooks) =
    local _walk(o, stack) =
        local walkOne(key, value) =
            local newStack = stack + [key];
            if std.isObject(value)
            then
                local onObjectEntry = std.get(hooks, 'objectEntry');
                local entered =
                    if onObjectEntry == null
                    then value
                    else onObjectEntry(newStack, value);
                local onObjectRecurse = std.get(hooks, 'objectRecurse');
                local recursed =
                    if onObjectRecurse == null || onObjectRecurse(newStack, entered)
                    then _walk(entered, newStack)
                    else entered;
                local onObjectExit = std.get(hooks, 'objectExit');
                local exited =
                    if onObjectExit == null
                    then recursed
                    else onObjectExit(newStack, recursed);
                exited
            else value;
        if std.isObject(o) then
            {
                [kv.key]: walkOne(kv.key, kv.value)
                for kv in std.objectKeysValues(o)
            }
        else o;
    _walk(o, []);

{
    anyEqual(a, value): std.any(std.map(function(x) x == value, a)),
    isKubernetesObject(o):
        std.isObject(o)
        && std.objectHas(o, 'apiVersion')
        && std.objectHas(o, 'kind'),
    rGet(o, fields, default = null): _rGet(o, fields, default).value,
    rObjectHas(o, fields): _rGet(o, fields).exists,
    toBoolean(x): if std.isBoolean(x) then x else x == 'true',
    walk(o, hooks): walk(o, hooks),
}