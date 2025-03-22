function (jsonnetfile)

{
    certManager: (import './cert-manager.libsonnet')(jsonnetfile),
    cloudNativePG: (import './cloudnative-pg.libsonnet')(jsonnetfile),
    externalSecrets: (import './external-secrets.libsonnet')(jsonnetfile),
    gatewayApi: (import './gateway-api.libsonnet')(jsonnetfile),
    k8s: (import './k8s.libsonnet')(jsonnetfile),
}