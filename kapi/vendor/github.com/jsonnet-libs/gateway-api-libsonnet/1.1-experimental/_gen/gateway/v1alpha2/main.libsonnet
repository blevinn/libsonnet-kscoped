{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='v1alpha2', url='', help=''),
  backendLBPolicy: (import 'backendLBPolicy.libsonnet'),
  grpcRoute: (import 'grpcRoute.libsonnet'),
  referenceGrant: (import 'referenceGrant.libsonnet'),
  tcpRoute: (import 'tcpRoute.libsonnet'),
  tlsRoute: (import 'tlsRoute.libsonnet'),
  udpRoute: (import 'udpRoute.libsonnet'),
}
