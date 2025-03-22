function (jsonnetfile)

local util = import './util.libsonnet';

local allVersions = {
    '0.7': import 'github.com/jsonnet-libs/gateway-api-libsonnet/0.7/main.libsonnet',
//    '0.7-experimental': import 'github.com/jsonnet-libs/gateway-api-libsonnet/0.7-experimental/main.libsonnet',
    '0.8': import 'github.com/jsonnet-libs/gateway-api-libsonnet/0.8/main.libsonnet',
//    '0.8-experimental': import 'github.com/jsonnet-libs/gateway-api-libsonnet/0.8-experimental/main.libsonnet',
    '1.0': import 'github.com/jsonnet-libs/gateway-api-libsonnet/1.0/main.libsonnet',
//    '1.0-experimental': import 'github.com/jsonnet-libs/gateway-api-libsonnet/1.0-experimental/main.libsonnet',
    '1.1': import 'github.com/jsonnet-libs/gateway-api-libsonnet/1.1/main.libsonnet',
//    '1.1-experimental': import 'github.com/jsonnet-libs/gateway-api-libsonnet/1.1-experimental/main.libsonnet',
    '1.2': import 'github.com/jsonnet-libs/gateway-api-libsonnet/1.2/main.libsonnet',
//    '1.2-experimental': import 'github.com/jsonnet-libs/gateway-api-libsonnet/1.2-experimental/main.libsonnet',
};

local versions = util.dependencyVersions(
    allVersions,
    std.get(jsonnetfile, 'dependencies', []),
    function (x) util.matchesGitRepsitory(x, 'https://github.com/jsonnet-libs/gateway-api-libsonnet.git'),
    util.extractVersionFromSubdir
);

local max_version = util.maxVersion(std.objectFields(versions));

{
    getApi(version = max_version):
        if version == 'experimental' then
            util.apisFromK(versions[max_version+'-experimental'], apiGroup='networking.k8s.io')
        else
            util.apisFromK(versions[version], apiGroup='networking.k8s.io')
}