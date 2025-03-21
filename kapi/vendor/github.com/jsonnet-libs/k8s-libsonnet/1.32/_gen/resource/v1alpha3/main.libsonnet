{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='v1alpha3', url='', help=''),
  allocatedDeviceStatus: (import 'allocatedDeviceStatus.libsonnet'),
  allocationResult: (import 'allocationResult.libsonnet'),
  basicDevice: (import 'basicDevice.libsonnet'),
  celDeviceSelector: (import 'celDeviceSelector.libsonnet'),
  device: (import 'device.libsonnet'),
  deviceAllocationConfiguration: (import 'deviceAllocationConfiguration.libsonnet'),
  deviceAllocationResult: (import 'deviceAllocationResult.libsonnet'),
  deviceAttribute: (import 'deviceAttribute.libsonnet'),
  deviceClaim: (import 'deviceClaim.libsonnet'),
  deviceClaimConfiguration: (import 'deviceClaimConfiguration.libsonnet'),
  deviceClass: (import 'deviceClass.libsonnet'),
  deviceClassConfiguration: (import 'deviceClassConfiguration.libsonnet'),
  deviceClassSpec: (import 'deviceClassSpec.libsonnet'),
  deviceConstraint: (import 'deviceConstraint.libsonnet'),
  deviceRequest: (import 'deviceRequest.libsonnet'),
  deviceRequestAllocationResult: (import 'deviceRequestAllocationResult.libsonnet'),
  deviceSelector: (import 'deviceSelector.libsonnet'),
  networkDeviceData: (import 'networkDeviceData.libsonnet'),
  opaqueDeviceConfiguration: (import 'opaqueDeviceConfiguration.libsonnet'),
  resourceClaim: (import 'resourceClaim.libsonnet'),
  resourceClaimConsumerReference: (import 'resourceClaimConsumerReference.libsonnet'),
  resourceClaimSpec: (import 'resourceClaimSpec.libsonnet'),
  resourceClaimStatus: (import 'resourceClaimStatus.libsonnet'),
  resourceClaimTemplate: (import 'resourceClaimTemplate.libsonnet'),
  resourceClaimTemplateSpec: (import 'resourceClaimTemplateSpec.libsonnet'),
  resourcePool: (import 'resourcePool.libsonnet'),
  resourceSlice: (import 'resourceSlice.libsonnet'),
  resourceSliceSpec: (import 'resourceSliceSpec.libsonnet'),
}
