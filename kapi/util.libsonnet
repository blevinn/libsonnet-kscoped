local semver = (import 'github.com/Duologic/semver-libsonnet/semver/main.libsonnet') + {
    local _normalize(x) =
        local splitplus = std.splitLimit(x, '+', 1);
        local splitdash = std.splitLimit(splitplus[0], '-', 1);
        local split = std.splitLimit(splitdash[0], '.', 2) + ['0', '0'];
        std.join('+', [ std.join('-', [ std.join('.', split[0:3]) ] + splitdash[1:]) ] + splitplus[1:]),
    
    parse(x): super.parse(_normalize(x)),
    validate(x): super.validate(_normalize(x)),
};

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

local rGet(o, keys, default = null) =
    local rGetRec(o, keys) =
        if std.length(keys) == 0 then
            o
        else if std.objectHas(o, keys[0]) then
            rGetRec(o[keys[0]], keys[1:])
        else
            default;
    if std.isString(keys) 
    then rGetRec(o, std.split(keys, '.'))
    else rGetRec(o, keys);

local matchesGitRepsitory(dependency, repository) =
    rGet(dependency, 'source.git.remote') == repository;

local extractVersionFromSubdir(dependency) = rGet(dependency, 'source.git.subdir');

local traceX(s, x) = std.trace(s + std.toString(x), x);

local dependencyVersions(allVersions, dependencies, match, extractVersion) = {
    [extractVersion(d)]: allVersions[extractVersion(d)]
    for d in dependencies
    if match(d) && traceX('eV = ', semver.validate(traceX('d', extractVersion(d)))) && std.objectHas(allVersions, extractVersion(d))
};

local maxVersion(versions) =
    local version_order(x) =
        local parsed = semver.parse(x);
        local prereleasePenalty = if std.objectHas(parsed, 'prerelease') then 0 else 3;
        local buildPenalty = if std.objectHas(parsed, 'build') then 0 else 5;
        -(std.parseInt(parsed.major) * 100000 + std.parseInt(parsed.minor) * 1000 + std.parseInt(parsed.patch) * 10 + prereleasePenalty + buildPenalty);
    if std.length(versions) == 0
    then error 'No matching version found in dependencies'
    else std.sort(versions, version_order)[0];

{
    apisFromK:: apisFromK,
    capitalize:: capitalize,
    dependencyVersions:: dependencyVersions,
    extractVersionFromSubdir:: extractVersionFromSubdir,
    matchesGitRepsitory:: matchesGitRepsitory,
    maxVersion:: maxVersion,
    rGet:: rGet,
}