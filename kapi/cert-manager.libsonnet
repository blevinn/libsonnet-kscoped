local util = import './util.libsonnet';

local versions = {
    '1.3': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.3/main.libsonnet',
    '1.4': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.4/main.libsonnet',
    '1.5': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.5/main.libsonnet',
    '1.6': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.6/main.libsonnet',
    '1.7': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.7/main.libsonnet',
    '1.8': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.8/main.libsonnet',
    '1.9': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.9/main.libsonnet',
    '1.10': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.10/main.libsonnet',
    '1.11': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.11/main.libsonnet',
    '1.12': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.12/main.libsonnet',
    '1.13': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.13/main.libsonnet',
    '1.14': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.14/main.libsonnet',
    '1.15': import './vendor/github.com/jsonnet-libs/cert-manager-libsonnet/1.15/main.libsonnet',
};

{
    getApi(version = '1.15'): util.apisFromK(versions[version], rootApi='nogroup', apiGroup='cert-manager.io')
}