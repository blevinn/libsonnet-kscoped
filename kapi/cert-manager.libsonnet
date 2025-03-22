function (jsonnetfile)

local util = import './util.libsonnet';


local allVersions = {
    '1.3': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.3/main.libsonnet',
    '1.4': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.4/main.libsonnet',
    '1.5': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.5/main.libsonnet',
    '1.6': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.6/main.libsonnet',
    '1.7': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.7/main.libsonnet',
    '1.8': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.8/main.libsonnet',
    '1.9': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.9/main.libsonnet',
    '1.10': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.10/main.libsonnet',
    '1.11': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.11/main.libsonnet',
    '1.12': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.12/main.libsonnet',
    '1.13': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.13/main.libsonnet',
    '1.14': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.14/main.libsonnet',
    '1.15': import 'github.com/jsonnet-libs/cert-manager-libsonnet/1.15/main.libsonnet',
};

local versions = util.dependencyVersions(
    allVersions,
    std.get(jsonnetfile, 'dependencies', []),
    function (x) util.matchesGitRepsitory(x, 'https://github.com/jsonnet-libs/cert-manager-libsonnet.git'),
    util.extractVersionFromSubdir
);

local max_version = util.maxVersion(std.objectFields(versions));

{
    getApi(version = max_version):
        util.apisFromK(versions[max_version], rootApi='nogroup', apiGroup='cert-manager.io')
}
