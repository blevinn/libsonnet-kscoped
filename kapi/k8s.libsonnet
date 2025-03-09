local util = import './util.libsonnet';

local versions = {
    '1.28': import './vendor/github.com/jsonnet-libs/k8s-libsonnet/1.28/main.libsonnet',
    '1.29': import './vendor/github.com/jsonnet-libs/k8s-libsonnet/1.29/main.libsonnet',
    '1.30': import './vendor/github.com/jsonnet-libs/k8s-libsonnet/1.30/main.libsonnet',
    '1.31': import './vendor/github.com/jsonnet-libs/k8s-libsonnet/1.31/main.libsonnet',
    '1.32': import './vendor/github.com/jsonnet-libs/k8s-libsonnet/1.32/main.libsonnet',
};



{
    getApi(version = '1.32'): util.apisFromK(versions[version])
}