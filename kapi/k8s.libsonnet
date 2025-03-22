function (jsonnetfile)

local util = import './util.libsonnet';

local allVersions = {
    '1.28': import 'github.com/jsonnet-libs/k8s-libsonnet/1.28/main.libsonnet',
    '1.29': import 'github.com/jsonnet-libs/k8s-libsonnet/1.29/main.libsonnet',
    '1.30': import 'github.com/jsonnet-libs/k8s-libsonnet/1.30/main.libsonnet',
    '1.31': import 'github.com/jsonnet-libs/k8s-libsonnet/1.31/main.libsonnet',
    '1.32': import 'github.com/jsonnet-libs/k8s-libsonnet/1.32/main.libsonnet',
};

local versions = util.dependencyVersions(
    allVersions,
    std.get(jsonnetfile, 'dependencies', []),
    function (x) util.matchesGitRepsitory(x, 'https://github.com/jsonnet-libs/k8s-libsonnet.git'),
    util.extractVersionFromSubdir
);

local max_version = util.maxVersion(std.objectFields(versions));

{
    getApi(version = max_version): util.apisFromK(versions[version])
}