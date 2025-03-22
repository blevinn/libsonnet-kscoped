function (jsonnetfile)

local util = import './util.libsonnet';

local allVersions = {
    '1.23.6': import 'github.com/jsonnet-libs/cloudnative-pg-libsonnet/1.23.6/main.libsonnet',
    '1.24.2': import 'github.com/jsonnet-libs/cloudnative-pg-libsonnet/1.24.2/main.libsonnet',
    '1.25.0': import 'github.com/jsonnet-libs/cloudnative-pg-libsonnet/1.25.0/main.libsonnet',
};

local versions = util.dependencyVersions(
    allVersions,
    std.get(jsonnetfile, 'dependencies', []),
    function (x) util.matchesGitRepsitory(x, 'https://github.com/jsonnet-libs/cloudnative-pg-libsonnet.git'),
    util.extractVersionFromSubdir
);

local max_version = util.maxVersion(std.objectFields(versions));

{
    getApi(version = max_version): util.apisFromK(versions[version], apiGroup='cnpg.io')
}