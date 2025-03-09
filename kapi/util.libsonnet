local capitalize(s) =
    if std.type(s) != 'string' then
        error 'capitalize expects a string'
    else if std.length(s) == 0 then
        s
    else
        std.asciiUpper(s[0]) + s[1:];

local apisFromK(basePackage, apiGroup = '', rootApi = 'core') =
    local capitalizeKinds(kinds) = {
            [capitalize(kv.key)]: kv.value
            for kv in std.objectKeysValuesAll(kinds)
        };
    local makeVersionedApiName(apiName, apiVersion) =
        local api = std.join('.', []
            + (if apiName == rootApi then [] else [apiName])
            + (if apiGroup == '' then [] else [apiGroup]));
        if api == '' then
            apiVersion
        else 
            std.join('/', [api, apiVersion]);
    local makeVersionedApis(agg, api) = agg + {
            [makeVersionedApiName(api.key, v.key)]: capitalizeKinds(v.value)
            for v in std.objectKeysValuesAll(api.value)
            if api.key != '#' && v.key != '#'
        };
    std.foldl(makeVersionedApis, std.objectKeysValuesAll(basePackage), {});

{
    apisFromK:: apisFromK,
    capitalize: capitalize,
}