local util = import './util.libsonnet';

local versions = {
    '0.7': import './vendor/github.com/jsonnet-libs/gateway-api-libsonnet/0.7/main.libsonnet',
    '0.7-experimental': import './vendor/github.com/jsonnet-libs/gateway-api-libsonnet/0.7-experimental/main.libsonnet',
    '0.8': import './vendor/github.com/jsonnet-libs/gateway-api-libsonnet/0.8/main.libsonnet',
    '0.8-experimental': import './vendor/github.com/jsonnet-libs/gateway-api-libsonnet/0.8-experimental/main.libsonnet',
    '1.0': import './vendor/github.com/jsonnet-libs/gateway-api-libsonnet/1.0/main.libsonnet',
    '1.0-experimental': import './vendor/github.com/jsonnet-libs/gateway-api-libsonnet/1.0-experimental/main.libsonnet',
    '1.1': import './vendor/github.com/jsonnet-libs/gateway-api-libsonnet/1.1/main.libsonnet',
    '1.1-experimental': import './vendor/github.com/jsonnet-libs/gateway-api-libsonnet/1.1-experimental/main.libsonnet',
    '1.2': import './vendor/github.com/jsonnet-libs/gateway-api-libsonnet/1.2/main.libsonnet',
    '1.2-experimental': import './vendor/github.com/jsonnet-libs/gateway-api-libsonnet/1.2-experimental/main.libsonnet',
};

{
    getApi(version = '1.2'):
        if version == 'experimental' then
            util.apisFromK(versions['1.2-experimental'], apiGroup='networking.k8s.io')
        else
            util.apisFromK(versions[version], apiGroup='networking.k8s.io')
}