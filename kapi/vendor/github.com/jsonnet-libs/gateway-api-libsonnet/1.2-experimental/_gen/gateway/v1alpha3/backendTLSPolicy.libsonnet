{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='backendTLSPolicy', url='', help='"BackendTLSPolicy provides a way to configure how a Gateway\\nconnects to a Backend via TLS."'),
  '#metadata':: d.obj(help='"ObjectMeta is metadata that all persisted resources must have, which includes all objects users must create."'),
  metadata: {
    '#withAnnotations':: d.fn(help='"Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. More info: http://kubernetes.io/docs/user-guide/annotations"', args=[d.arg(name='annotations', type=d.T.object)]),
    withAnnotations(annotations): { metadata+: { annotations: annotations } },
    '#withAnnotationsMixin':: d.fn(help='"Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. More info: http://kubernetes.io/docs/user-guide/annotations"\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='annotations', type=d.T.object)]),
    withAnnotationsMixin(annotations): { metadata+: { annotations+: annotations } },
    '#withClusterName':: d.fn(help='"The name of the cluster which the object belongs to. This is used to distinguish resources with same name and namespace in different clusters. This field is not set anywhere right now and apiserver is going to ignore it if set in create or update request."', args=[d.arg(name='clusterName', type=d.T.string)]),
    withClusterName(clusterName): { metadata+: { clusterName: clusterName } },
    '#withCreationTimestamp':: d.fn(help='"Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers."', args=[d.arg(name='creationTimestamp', type=d.T.string)]),
    withCreationTimestamp(creationTimestamp): { metadata+: { creationTimestamp: creationTimestamp } },
    '#withDeletionGracePeriodSeconds':: d.fn(help='"Number of seconds allowed for this object to gracefully terminate before it will be removed from the system. Only set when deletionTimestamp is also set. May only be shortened. Read-only."', args=[d.arg(name='deletionGracePeriodSeconds', type=d.T.integer)]),
    withDeletionGracePeriodSeconds(deletionGracePeriodSeconds): { metadata+: { deletionGracePeriodSeconds: deletionGracePeriodSeconds } },
    '#withDeletionTimestamp':: d.fn(help='"Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers."', args=[d.arg(name='deletionTimestamp', type=d.T.string)]),
    withDeletionTimestamp(deletionTimestamp): { metadata+: { deletionTimestamp: deletionTimestamp } },
    '#withFinalizers':: d.fn(help='"Must be empty before the object is deleted from the registry. Each entry is an identifier for the responsible component that will remove the entry from the list. If the deletionTimestamp of the object is non-nil, entries in this list can only be removed. Finalizers may be processed and removed in any order.  Order is NOT enforced because it introduces significant risk of stuck finalizers. finalizers is a shared field, any actor with permission can reorder it. If the finalizer list is processed in order, then this can lead to a situation in which the component responsible for the first finalizer in the list is waiting for a signal (field value, external system, or other) produced by a component responsible for a finalizer later in the list, resulting in a deadlock. Without enforced ordering finalizers are free to order amongst themselves and are not vulnerable to ordering changes in the list."', args=[d.arg(name='finalizers', type=d.T.array)]),
    withFinalizers(finalizers): { metadata+: { finalizers: if std.isArray(v=finalizers) then finalizers else [finalizers] } },
    '#withFinalizersMixin':: d.fn(help='"Must be empty before the object is deleted from the registry. Each entry is an identifier for the responsible component that will remove the entry from the list. If the deletionTimestamp of the object is non-nil, entries in this list can only be removed. Finalizers may be processed and removed in any order.  Order is NOT enforced because it introduces significant risk of stuck finalizers. finalizers is a shared field, any actor with permission can reorder it. If the finalizer list is processed in order, then this can lead to a situation in which the component responsible for the first finalizer in the list is waiting for a signal (field value, external system, or other) produced by a component responsible for a finalizer later in the list, resulting in a deadlock. Without enforced ordering finalizers are free to order amongst themselves and are not vulnerable to ordering changes in the list."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='finalizers', type=d.T.array)]),
    withFinalizersMixin(finalizers): { metadata+: { finalizers+: if std.isArray(v=finalizers) then finalizers else [finalizers] } },
    '#withGenerateName':: d.fn(help='"GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF the Name field has not been provided. If this field is used, the name returned to the client will be different than the name passed. This value will also be combined with a unique suffix. The provided value has the same validation rules as the Name field, and may be truncated by the length of the suffix required to make the value unique on the server.\\n\\nIf this field is specified and the generated name exists, the server will NOT return a 409 - instead, it will either return 201 Created or 500 with Reason ServerTimeout indicating a unique name could not be found in the time allotted, and the client should retry (optionally after the time indicated in the Retry-After header).\\n\\nApplied only if Name is not specified. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#idempotency"', args=[d.arg(name='generateName', type=d.T.string)]),
    withGenerateName(generateName): { metadata+: { generateName: generateName } },
    '#withGeneration':: d.fn(help='"A sequence number representing a specific generation of the desired state. Populated by the system. Read-only."', args=[d.arg(name='generation', type=d.T.integer)]),
    withGeneration(generation): { metadata+: { generation: generation } },
    '#withLabels':: d.fn(help='"Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels"', args=[d.arg(name='labels', type=d.T.object)]),
    withLabels(labels): { metadata+: { labels: labels } },
    '#withLabelsMixin':: d.fn(help='"Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels"\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='labels', type=d.T.object)]),
    withLabelsMixin(labels): { metadata+: { labels+: labels } },
    '#withName':: d.fn(help='"Name must be unique within a namespace. Is required when creating resources, although some resources may allow a client to request the generation of an appropriate name automatically. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names"', args=[d.arg(name='name', type=d.T.string)]),
    withName(name): { metadata+: { name: name } },
    '#withNamespace':: d.fn(help='"Namespace defines the space within which each name must be unique. An empty namespace is equivalent to the \\"default\\" namespace, but \\"default\\" is the canonical representation. Not all objects are required to be scoped to a namespace - the value of this field for those objects will be empty.\\n\\nMust be a DNS_LABEL. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/namespaces"', args=[d.arg(name='namespace', type=d.T.string)]),
    withNamespace(namespace): { metadata+: { namespace: namespace } },
    '#withOwnerReferences':: d.fn(help='"List of objects depended by this object. If ALL objects in the list have been deleted, this object will be garbage collected. If this object is managed by a controller, then an entry in this list will point to this controller, with the controller field set to true. There cannot be more than one managing controller."', args=[d.arg(name='ownerReferences', type=d.T.array)]),
    withOwnerReferences(ownerReferences): { metadata+: { ownerReferences: if std.isArray(v=ownerReferences) then ownerReferences else [ownerReferences] } },
    '#withOwnerReferencesMixin':: d.fn(help='"List of objects depended by this object. If ALL objects in the list have been deleted, this object will be garbage collected. If this object is managed by a controller, then an entry in this list will point to this controller, with the controller field set to true. There cannot be more than one managing controller."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='ownerReferences', type=d.T.array)]),
    withOwnerReferencesMixin(ownerReferences): { metadata+: { ownerReferences+: if std.isArray(v=ownerReferences) then ownerReferences else [ownerReferences] } },
    '#withResourceVersion':: d.fn(help='"An opaque value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server. They may only be valid for a particular resource or set of resources.\\n\\nPopulated by the system. Read-only. Value must be treated as opaque by clients and . More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency"', args=[d.arg(name='resourceVersion', type=d.T.string)]),
    withResourceVersion(resourceVersion): { metadata+: { resourceVersion: resourceVersion } },
    '#withSelfLink':: d.fn(help='"SelfLink is a URL representing this object. Populated by the system. Read-only.\\n\\nDEPRECATED Kubernetes will stop propagating this field in 1.20 release and the field is planned to be removed in 1.21 release."', args=[d.arg(name='selfLink', type=d.T.string)]),
    withSelfLink(selfLink): { metadata+: { selfLink: selfLink } },
    '#withUid':: d.fn(help='"UID is the unique in time and space value for this object. It is typically generated by the server on successful creation of a resource and is not allowed to change on PUT operations.\\n\\nPopulated by the system. Read-only. More info: http://kubernetes.io/docs/user-guide/identifiers#uids"', args=[d.arg(name='uid', type=d.T.string)]),
    withUid(uid): { metadata+: { uid: uid } },
  },
  '#new':: d.fn(help='new returns an instance of BackendTLSPolicy', args=[d.arg(name='name', type=d.T.string)]),
  new(name): {
    apiVersion: 'gateway.networking.k8s.io/v1alpha3',
    kind: 'BackendTLSPolicy',
  } + self.metadata.withName(name=name),
  '#spec':: d.obj(help='"Spec defines the desired state of BackendTLSPolicy."'),
  spec: {
    '#targetRefs':: d.obj(help='"TargetRefs identifies an API object to apply the policy to.\\nOnly Services have Extended support. Implementations MAY support\\nadditional objects, with Implementation Specific support.\\nNote that this config applies to the entire referenced resource\\nby default, but this default may change in the future to provide\\na more granular application of the policy.\\n\\nSupport: Extended for Kubernetes Service\\n\\nSupport: Implementation-specific for any other resource"'),
    targetRefs: {
      '#withGroup':: d.fn(help='"Group is the group of the target resource."', args=[d.arg(name='group', type=d.T.string)]),
      withGroup(group): { group: group },
      '#withKind':: d.fn(help='"Kind is kind of the target resource."', args=[d.arg(name='kind', type=d.T.string)]),
      withKind(kind): { kind: kind },
      '#withName':: d.fn(help='"Name is the name of the target resource."', args=[d.arg(name='name', type=d.T.string)]),
      withName(name): { name: name },
      '#withSectionName':: d.fn(help="\"SectionName is the name of a section within the target resource. When\\nunspecified, this targetRef targets the entire resource. In the following\\nresources, SectionName is interpreted as the following:\\n\\n* Gateway: Listener name\\n* HTTPRoute: HTTPRouteRule name\\n* Service: Port name\\n\\nIf a SectionName is specified, but does not exist on the targeted object,\\nthe Policy must fail to attach, and the policy implementation should record\\na `ResolvedRefs` or similar Condition in the Policy's status.\"", args=[d.arg(name='sectionName', type=d.T.string)]),
      withSectionName(sectionName): { sectionName: sectionName },
    },
    '#validation':: d.obj(help='"Validation contains backend TLS validation configuration."'),
    validation: {
      '#caCertificateRefs':: d.obj(help='"CACertificateRefs contains one or more references to Kubernetes objects that\\ncontain a PEM-encoded TLS CA certificate bundle, which is used to\\nvalidate a TLS handshake between the Gateway and backend Pod.\\n\\nIf CACertificateRefs is empty or unspecified, then WellKnownCACertificates must be\\nspecified. Only one of CACertificateRefs or WellKnownCACertificates may be specified,\\nnot both. If CACertifcateRefs is empty or unspecified, the configuration for\\nWellKnownCACertificates MUST be honored instead if supported by the implementation.\\n\\nReferences to a resource in a different namespace are invalid for the\\nmoment, although we will revisit this in the future.\\n\\nA single CACertificateRef to a Kubernetes ConfigMap kind has \\"Core\\" support.\\nImplementations MAY choose to support attaching multiple certificates to\\na backend, but this behavior is implementation-specific.\\n\\nSupport: Core - An optional single reference to a Kubernetes ConfigMap,\\nwith the CA certificate in a key named `ca.crt`.\\n\\nSupport: Implementation-specific (More than one reference, or other kinds\\nof resources)."'),
      caCertificateRefs: {
        '#withGroup':: d.fn(help='"Group is the group of the referent. For example, \\"gateway.networking.k8s.io\\".\\nWhen unspecified or empty string, core API group is inferred."', args=[d.arg(name='group', type=d.T.string)]),
        withGroup(group): { group: group },
        '#withKind':: d.fn(help='"Kind is kind of the referent. For example \\"HTTPRoute\\" or \\"Service\\"."', args=[d.arg(name='kind', type=d.T.string)]),
        withKind(kind): { kind: kind },
        '#withName':: d.fn(help='"Name is the name of the referent."', args=[d.arg(name='name', type=d.T.string)]),
        withName(name): { name: name },
      },
      '#subjectAltNames':: d.obj(help='"SubjectAltNames contains one or more Subject Alternative Names.\\nWhen specified, the certificate served from the backend MUST have at least one\\nSubject Alternate Name matching one of the specified SubjectAltNames.\\n\\nSupport: Core"'),
      subjectAltNames: {
        '#withHostname':: d.fn(help='"Hostname contains Subject Alternative Name specified in DNS name format.\\nRequired when Type is set to Hostname, ignored otherwise.\\n\\nSupport: Core"', args=[d.arg(name='hostname', type=d.T.string)]),
        withHostname(hostname): { hostname: hostname },
        '#withType':: d.fn(help='"Type determines the format of the Subject Alternative Name. Always required.\\n\\nSupport: Core"', args=[d.arg(name='type', type=d.T.string)]),
        withType(type): { type: type },
        '#withUri':: d.fn(help='"URI contains Subject Alternative Name specified in a full URI format.\\nIt MUST include both a scheme (e.g., \\"http\\" or \\"ftp\\") and a scheme-specific-part.\\nCommon values include SPIFFE IDs like \\"spiffe://mycluster.example.com/ns/myns/sa/svc1sa\\".\\nRequired when Type is set to URI, ignored otherwise.\\n\\nSupport: Core"', args=[d.arg(name='uri', type=d.T.string)]),
        withUri(uri): { uri: uri },
      },
      '#withCaCertificateRefs':: d.fn(help='"CACertificateRefs contains one or more references to Kubernetes objects that\\ncontain a PEM-encoded TLS CA certificate bundle, which is used to\\nvalidate a TLS handshake between the Gateway and backend Pod.\\n\\nIf CACertificateRefs is empty or unspecified, then WellKnownCACertificates must be\\nspecified. Only one of CACertificateRefs or WellKnownCACertificates may be specified,\\nnot both. If CACertifcateRefs is empty or unspecified, the configuration for\\nWellKnownCACertificates MUST be honored instead if supported by the implementation.\\n\\nReferences to a resource in a different namespace are invalid for the\\nmoment, although we will revisit this in the future.\\n\\nA single CACertificateRef to a Kubernetes ConfigMap kind has \\"Core\\" support.\\nImplementations MAY choose to support attaching multiple certificates to\\na backend, but this behavior is implementation-specific.\\n\\nSupport: Core - An optional single reference to a Kubernetes ConfigMap,\\nwith the CA certificate in a key named `ca.crt`.\\n\\nSupport: Implementation-specific (More than one reference, or other kinds\\nof resources)."', args=[d.arg(name='caCertificateRefs', type=d.T.array)]),
      withCaCertificateRefs(caCertificateRefs): { spec+: { validation+: { caCertificateRefs: if std.isArray(v=caCertificateRefs) then caCertificateRefs else [caCertificateRefs] } } },
      '#withCaCertificateRefsMixin':: d.fn(help='"CACertificateRefs contains one or more references to Kubernetes objects that\\ncontain a PEM-encoded TLS CA certificate bundle, which is used to\\nvalidate a TLS handshake between the Gateway and backend Pod.\\n\\nIf CACertificateRefs is empty or unspecified, then WellKnownCACertificates must be\\nspecified. Only one of CACertificateRefs or WellKnownCACertificates may be specified,\\nnot both. If CACertifcateRefs is empty or unspecified, the configuration for\\nWellKnownCACertificates MUST be honored instead if supported by the implementation.\\n\\nReferences to a resource in a different namespace are invalid for the\\nmoment, although we will revisit this in the future.\\n\\nA single CACertificateRef to a Kubernetes ConfigMap kind has \\"Core\\" support.\\nImplementations MAY choose to support attaching multiple certificates to\\na backend, but this behavior is implementation-specific.\\n\\nSupport: Core - An optional single reference to a Kubernetes ConfigMap,\\nwith the CA certificate in a key named `ca.crt`.\\n\\nSupport: Implementation-specific (More than one reference, or other kinds\\nof resources)."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='caCertificateRefs', type=d.T.array)]),
      withCaCertificateRefsMixin(caCertificateRefs): { spec+: { validation+: { caCertificateRefs+: if std.isArray(v=caCertificateRefs) then caCertificateRefs else [caCertificateRefs] } } },
      '#withHostname':: d.fn(help='"Hostname is used for two purposes in the connection between Gateways and\\nbackends:\\n\\n1. Hostname MUST be used as the SNI to connect to the backend (RFC 6066).\\n2. If SubjectAltNames is not specified, Hostname MUST be used for\\n   authentication and MUST match the certificate served by the matching\\n   backend.\\n\\nSupport: Core"', args=[d.arg(name='hostname', type=d.T.string)]),
      withHostname(hostname): { spec+: { validation+: { hostname: hostname } } },
      '#withSubjectAltNames':: d.fn(help='"SubjectAltNames contains one or more Subject Alternative Names.\\nWhen specified, the certificate served from the backend MUST have at least one\\nSubject Alternate Name matching one of the specified SubjectAltNames.\\n\\nSupport: Core"', args=[d.arg(name='subjectAltNames', type=d.T.array)]),
      withSubjectAltNames(subjectAltNames): { spec+: { validation+: { subjectAltNames: if std.isArray(v=subjectAltNames) then subjectAltNames else [subjectAltNames] } } },
      '#withSubjectAltNamesMixin':: d.fn(help='"SubjectAltNames contains one or more Subject Alternative Names.\\nWhen specified, the certificate served from the backend MUST have at least one\\nSubject Alternate Name matching one of the specified SubjectAltNames.\\n\\nSupport: Core"\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='subjectAltNames', type=d.T.array)]),
      withSubjectAltNamesMixin(subjectAltNames): { spec+: { validation+: { subjectAltNames+: if std.isArray(v=subjectAltNames) then subjectAltNames else [subjectAltNames] } } },
      '#withWellKnownCACertificates':: d.fn(help='"WellKnownCACertificates specifies whether system CA certificates may be used in\\nthe TLS handshake between the gateway and backend pod.\\n\\nIf WellKnownCACertificates is unspecified or empty (\\"\\"), then CACertificateRefs\\nmust be specified with at least one entry for a valid configuration. Only one of\\nCACertificateRefs or WellKnownCACertificates may be specified, not both. If an\\nimplementation does not support the WellKnownCACertificates field or the value\\nsupplied is not supported, the Status Conditions on the Policy MUST be\\nupdated to include an Accepted: False Condition with Reason: Invalid.\\n\\nSupport: Implementation-specific"', args=[d.arg(name='wellKnownCACertificates', type=d.T.string)]),
      withWellKnownCACertificates(wellKnownCACertificates): { spec+: { validation+: { wellKnownCACertificates: wellKnownCACertificates } } },
    },
    '#withOptions':: d.fn(help='"Options are a list of key/value pairs to enable extended TLS\\nconfiguration for each implementation. For example, configuring the\\nminimum TLS version or supported cipher suites.\\n\\nA set of common keys MAY be defined by the API in the future. To avoid\\nany ambiguity, implementation-specific definitions MUST use\\ndomain-prefixed names, such as `example.com/my-custom-option`.\\nUn-prefixed names are reserved for key names defined by Gateway API.\\n\\nSupport: Implementation-specific"', args=[d.arg(name='options', type=d.T.object)]),
    withOptions(options): { spec+: { options: options } },
    '#withOptionsMixin':: d.fn(help='"Options are a list of key/value pairs to enable extended TLS\\nconfiguration for each implementation. For example, configuring the\\nminimum TLS version or supported cipher suites.\\n\\nA set of common keys MAY be defined by the API in the future. To avoid\\nany ambiguity, implementation-specific definitions MUST use\\ndomain-prefixed names, such as `example.com/my-custom-option`.\\nUn-prefixed names are reserved for key names defined by Gateway API.\\n\\nSupport: Implementation-specific"\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='options', type=d.T.object)]),
    withOptionsMixin(options): { spec+: { options+: options } },
    '#withTargetRefs':: d.fn(help='"TargetRefs identifies an API object to apply the policy to.\\nOnly Services have Extended support. Implementations MAY support\\nadditional objects, with Implementation Specific support.\\nNote that this config applies to the entire referenced resource\\nby default, but this default may change in the future to provide\\na more granular application of the policy.\\n\\nSupport: Extended for Kubernetes Service\\n\\nSupport: Implementation-specific for any other resource"', args=[d.arg(name='targetRefs', type=d.T.array)]),
    withTargetRefs(targetRefs): { spec+: { targetRefs: if std.isArray(v=targetRefs) then targetRefs else [targetRefs] } },
    '#withTargetRefsMixin':: d.fn(help='"TargetRefs identifies an API object to apply the policy to.\\nOnly Services have Extended support. Implementations MAY support\\nadditional objects, with Implementation Specific support.\\nNote that this config applies to the entire referenced resource\\nby default, but this default may change in the future to provide\\na more granular application of the policy.\\n\\nSupport: Extended for Kubernetes Service\\n\\nSupport: Implementation-specific for any other resource"\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='targetRefs', type=d.T.array)]),
    withTargetRefsMixin(targetRefs): { spec+: { targetRefs+: if std.isArray(v=targetRefs) then targetRefs else [targetRefs] } },
  },
  '#mixin': 'ignore',
  mixin: self,
}
