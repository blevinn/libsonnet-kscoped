function (jsonnetfile)

local util = import './util.libsonnet';

local allVersions = {
    '0.4': import 'github.com/jsonnet-libs/external-secrets-libsonnet/0.4/main.libsonnet',
    '0.5': import 'github.com/jsonnet-libs/external-secrets-libsonnet/0.5/main.libsonnet',
    '0.6': import 'github.com/jsonnet-libs/external-secrets-libsonnet/0.6/main.libsonnet',
    '0.7': import 'github.com/jsonnet-libs/external-secrets-libsonnet/0.7/main.libsonnet',
    '0.8': import 'github.com/jsonnet-libs/external-secrets-libsonnet/0.8/main.libsonnet',
    '0.9': import 'github.com/jsonnet-libs/external-secrets-libsonnet/0.9/main.libsonnet',
};

local versions = util.dependencyVersions(
    allVersions,
    std.get(jsonnetfile, 'dependencies', []),
    function (x) util.matchesGitRepsitory(x, 'https://github.com/jsonnet-libs/external-secrets-libsonnet.git'),
    util.extractVersionFromSubdir
);

local max_version = util.maxVersion(std.objectFields(versions));

{
    getApi(version = max_version):
        util.apisFromK(versions[version], rootApi='nogroup', apiGroup='external-secrets.io')
}