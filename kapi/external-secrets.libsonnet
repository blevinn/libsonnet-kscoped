local util = import './util.libsonnet';

local versions = {
    '0.4': import './vendor/github.com/jsonnet-libs/external-secrets-libsonnet/0.4/main.libsonnet',
    '0.5': import './vendor/github.com/jsonnet-libs/external-secrets-libsonnet/0.5/main.libsonnet',
    '0.6': import './vendor/github.com/jsonnet-libs/external-secrets-libsonnet/0.6/main.libsonnet',
    '0.7': import './vendor/github.com/jsonnet-libs/external-secrets-libsonnet/0.7/main.libsonnet',
    '0.8': import './vendor/github.com/jsonnet-libs/external-secrets-libsonnet/0.8/main.libsonnet',
    '0.9': import './vendor/github.com/jsonnet-libs/external-secrets-libsonnet/0.9/main.libsonnet',
};

{
    getApi(version = '0.9'):
        util.apisFromK(versions[version], rootApi='nogroup', apiGroup='external-secrets.io')
}