{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='validatingAdmissionPolicyBindingSpec', url='', help='"ValidatingAdmissionPolicyBindingSpec is the specification of the ValidatingAdmissionPolicyBinding."'),
  '#matchResources':: d.obj(help='"MatchResources decides whether to run the admission control policy on an object based on whether it meets the match criteria. The exclude rules take precedence over include rules (if a resource matches both, it is excluded)"'),
  matchResources: {
    '#namespaceSelector':: d.obj(help='"A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects."'),
    namespaceSelector: {
      '#withMatchExpressions':: d.fn(help='"matchExpressions is a list of label selector requirements. The requirements are ANDed."', args=[d.arg(name='matchExpressions', type=d.T.array)]),
      withMatchExpressions(matchExpressions): { matchResources+: { namespaceSelector+: { matchExpressions: if std.isArray(v=matchExpressions) then matchExpressions else [matchExpressions] } } },
      '#withMatchExpressionsMixin':: d.fn(help='"matchExpressions is a list of label selector requirements. The requirements are ANDed."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='matchExpressions', type=d.T.array)]),
      withMatchExpressionsMixin(matchExpressions): { matchResources+: { namespaceSelector+: { matchExpressions+: if std.isArray(v=matchExpressions) then matchExpressions else [matchExpressions] } } },
      '#withMatchLabels':: d.fn(help='"matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \\"key\\", the operator is \\"In\\", and the values array contains only \\"value\\". The requirements are ANDed."', args=[d.arg(name='matchLabels', type=d.T.object)]),
      withMatchLabels(matchLabels): { matchResources+: { namespaceSelector+: { matchLabels: matchLabels } } },
      '#withMatchLabelsMixin':: d.fn(help='"matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \\"key\\", the operator is \\"In\\", and the values array contains only \\"value\\". The requirements are ANDed."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='matchLabels', type=d.T.object)]),
      withMatchLabelsMixin(matchLabels): { matchResources+: { namespaceSelector+: { matchLabels+: matchLabels } } },
    },
    '#objectSelector':: d.obj(help='"A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects."'),
    objectSelector: {
      '#withMatchExpressions':: d.fn(help='"matchExpressions is a list of label selector requirements. The requirements are ANDed."', args=[d.arg(name='matchExpressions', type=d.T.array)]),
      withMatchExpressions(matchExpressions): { matchResources+: { objectSelector+: { matchExpressions: if std.isArray(v=matchExpressions) then matchExpressions else [matchExpressions] } } },
      '#withMatchExpressionsMixin':: d.fn(help='"matchExpressions is a list of label selector requirements. The requirements are ANDed."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='matchExpressions', type=d.T.array)]),
      withMatchExpressionsMixin(matchExpressions): { matchResources+: { objectSelector+: { matchExpressions+: if std.isArray(v=matchExpressions) then matchExpressions else [matchExpressions] } } },
      '#withMatchLabels':: d.fn(help='"matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \\"key\\", the operator is \\"In\\", and the values array contains only \\"value\\". The requirements are ANDed."', args=[d.arg(name='matchLabels', type=d.T.object)]),
      withMatchLabels(matchLabels): { matchResources+: { objectSelector+: { matchLabels: matchLabels } } },
      '#withMatchLabelsMixin':: d.fn(help='"matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \\"key\\", the operator is \\"In\\", and the values array contains only \\"value\\". The requirements are ANDed."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='matchLabels', type=d.T.object)]),
      withMatchLabelsMixin(matchLabels): { matchResources+: { objectSelector+: { matchLabels+: matchLabels } } },
    },
    '#withExcludeResourceRules':: d.fn(help='"ExcludeResourceRules describes what operations on what resources/subresources the ValidatingAdmissionPolicy should not care about. The exclude rules take precedence over include rules (if a resource matches both, it is excluded)"', args=[d.arg(name='excludeResourceRules', type=d.T.array)]),
    withExcludeResourceRules(excludeResourceRules): { matchResources+: { excludeResourceRules: if std.isArray(v=excludeResourceRules) then excludeResourceRules else [excludeResourceRules] } },
    '#withExcludeResourceRulesMixin':: d.fn(help='"ExcludeResourceRules describes what operations on what resources/subresources the ValidatingAdmissionPolicy should not care about. The exclude rules take precedence over include rules (if a resource matches both, it is excluded)"\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='excludeResourceRules', type=d.T.array)]),
    withExcludeResourceRulesMixin(excludeResourceRules): { matchResources+: { excludeResourceRules+: if std.isArray(v=excludeResourceRules) then excludeResourceRules else [excludeResourceRules] } },
    '#withMatchPolicy':: d.fn(help='"matchPolicy defines how the \\"MatchResources\\" list is used to match incoming requests. Allowed values are \\"Exact\\" or \\"Equivalent\\".\\n\\n- Exact: match a request only if it exactly matches a specified rule. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, but \\"rules\\" only included `apiGroups:[\\"apps\\"], apiVersions:[\\"v1\\"], resources: [\\"deployments\\"]`, a request to apps/v1beta1 or extensions/v1beta1 would not be sent to the ValidatingAdmissionPolicy.\\n\\n- Equivalent: match a request if modifies a resource listed in rules, even via another API group or version. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, and \\"rules\\" only included `apiGroups:[\\"apps\\"], apiVersions:[\\"v1\\"], resources: [\\"deployments\\"]`, a request to apps/v1beta1 or extensions/v1beta1 would be converted to apps/v1 and sent to the ValidatingAdmissionPolicy.\\n\\nDefaults to \\"Equivalent\\', args=[d.arg(name='matchPolicy', type=d.T.string)]),
    withMatchPolicy(matchPolicy): { matchResources+: { matchPolicy: matchPolicy } },
    '#withResourceRules':: d.fn(help='"ResourceRules describes what operations on what resources/subresources the ValidatingAdmissionPolicy matches. The policy cares about an operation if it matches _any_ Rule."', args=[d.arg(name='resourceRules', type=d.T.array)]),
    withResourceRules(resourceRules): { matchResources+: { resourceRules: if std.isArray(v=resourceRules) then resourceRules else [resourceRules] } },
    '#withResourceRulesMixin':: d.fn(help='"ResourceRules describes what operations on what resources/subresources the ValidatingAdmissionPolicy matches. The policy cares about an operation if it matches _any_ Rule."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='resourceRules', type=d.T.array)]),
    withResourceRulesMixin(resourceRules): { matchResources+: { resourceRules+: if std.isArray(v=resourceRules) then resourceRules else [resourceRules] } },
  },
  '#paramRef':: d.obj(help='"ParamRef describes how to locate the params to be used as input to expressions of rules applied by a policy binding."'),
  paramRef: {
    '#selector':: d.obj(help='"A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects."'),
    selector: {
      '#withMatchExpressions':: d.fn(help='"matchExpressions is a list of label selector requirements. The requirements are ANDed."', args=[d.arg(name='matchExpressions', type=d.T.array)]),
      withMatchExpressions(matchExpressions): { paramRef+: { selector+: { matchExpressions: if std.isArray(v=matchExpressions) then matchExpressions else [matchExpressions] } } },
      '#withMatchExpressionsMixin':: d.fn(help='"matchExpressions is a list of label selector requirements. The requirements are ANDed."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='matchExpressions', type=d.T.array)]),
      withMatchExpressionsMixin(matchExpressions): { paramRef+: { selector+: { matchExpressions+: if std.isArray(v=matchExpressions) then matchExpressions else [matchExpressions] } } },
      '#withMatchLabels':: d.fn(help='"matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \\"key\\", the operator is \\"In\\", and the values array contains only \\"value\\". The requirements are ANDed."', args=[d.arg(name='matchLabels', type=d.T.object)]),
      withMatchLabels(matchLabels): { paramRef+: { selector+: { matchLabels: matchLabels } } },
      '#withMatchLabelsMixin':: d.fn(help='"matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \\"key\\", the operator is \\"In\\", and the values array contains only \\"value\\". The requirements are ANDed."\n\n**Note:** This function appends passed data to existing values', args=[d.arg(name='matchLabels', type=d.T.object)]),
      withMatchLabelsMixin(matchLabels): { paramRef+: { selector+: { matchLabels+: matchLabels } } },
    },
    '#withName':: d.fn(help='"name is the name of the resource being referenced.\\n\\nOne of `name` or `selector` must be set, but `name` and `selector` are mutually exclusive properties. If one is set, the other must be unset.\\n\\nA single parameter used for all admission requests can be configured by setting the `name` field, leaving `selector` blank, and setting namespace if `paramKind` is namespace-scoped."', args=[d.arg(name='name', type=d.T.string)]),
    withName(name): { paramRef+: { name: name } },
    '#withNamespace':: d.fn(help='"namespace is the namespace of the referenced resource. Allows limiting the search for params to a specific namespace. Applies to both `name` and `selector` fields.\\n\\nA per-namespace parameter may be used by specifying a namespace-scoped `paramKind` in the policy and leaving this field empty.\\n\\n- If `paramKind` is cluster-scoped, this field MUST be unset. Setting this field results in a configuration error.\\n\\n- If `paramKind` is namespace-scoped, the namespace of the object being evaluated for admission will be used when this field is left unset. Take care that if this is left empty the binding must not match any cluster-scoped resources, which will result in an error."', args=[d.arg(name='namespace', type=d.T.string)]),
    withNamespace(namespace): { paramRef+: { namespace: namespace } },
    '#withParameterNotFoundAction':: d.fn(help='"`parameterNotFoundAction` controls the behavior of the binding when the resource exists, and name or selector is valid, but there are no parameters matched by the binding. If the value is set to `Allow`, then no matched parameters will be treated as successful validation by the binding. If set to `Deny`, then no matched parameters will be subject to the `failurePolicy` of the policy.\\n\\nAllowed values are `Allow` or `Deny`\\n\\nRequired"', args=[d.arg(name='parameterNotFoundAction', type=d.T.string)]),
    withParameterNotFoundAction(parameterNotFoundAction): { paramRef+: { parameterNotFoundAction: parameterNotFoundAction } },
  },
  '#withPolicyName':: d.fn(help='"PolicyName references a ValidatingAdmissionPolicy name which the ValidatingAdmissionPolicyBinding binds to. If the referenced resource does not exist, this binding is considered invalid and will be ignored Required."', args=[d.arg(name='policyName', type=d.T.string)]),
  withPolicyName(policyName): { policyName: policyName },
  '#withValidationActions':: d.fn(help="\"validationActions declares how Validations of the referenced ValidatingAdmissionPolicy are enforced. If a validation evaluates to false it is always enforced according to these actions.\\n\\nFailures defined by the ValidatingAdmissionPolicy's FailurePolicy are enforced according to these actions only if the FailurePolicy is set to Fail, otherwise the failures are ignored. This includes compilation errors, runtime errors and misconfigurations of the policy.\\n\\nvalidationActions is declared as a set of action values. Order does not matter. validationActions may not contain duplicates of the same action.\\n\\nThe supported actions values are:\\n\\n\\\"Deny\\\" specifies that a validation failure results in a denied request.\\n\\n\\\"Warn\\\" specifies that a validation failure is reported to the request client in HTTP Warning headers, with a warning code of 299. Warnings can be sent both for allowed or denied admission responses.\\n\\n\\\"Audit\\\" specifies that a validation failure is included in the published audit event for the request. The audit event will contain a `validation.policy.admission.k8s.io/validation_failure` audit annotation with a value containing the details of the validation failures, formatted as a JSON list of objects, each with the following fields: - message: The validation failure message string - policy: The resource name of the ValidatingAdmissionPolicy - binding: The resource name of the ValidatingAdmissionPolicyBinding - expressionIndex: The index of the failed validations in the ValidatingAdmissionPolicy - validationActions: The enforcement actions enacted for the validation failure Example audit annotation: `\\\"validation.policy.admission.k8s.io/validation_failure\\\": \\\"[{\\\"message\\\": \\\"Invalid value\\\", {\\\"policy\\\": \\\"policy.example.com\\\", {\\\"binding\\\": \\\"policybinding.example.com\\\", {\\\"expressionIndex\\\": \\\"1\\\", {\\\"validationActions\\\": [\\\"Audit\\\"]}]\\\"`\\n\\nClients should expect to handle additional values by ignoring any values not recognized.\\n\\n\\\"Deny\\\" and \\\"Warn\\\" may not be used together since this combination needlessly duplicates the validation failure both in the API response body and the HTTP warning headers.\\n\\nRequired.\"", args=[d.arg(name='validationActions', type=d.T.array)]),
  withValidationActions(validationActions): { validationActions: if std.isArray(v=validationActions) then validationActions else [validationActions] },
  '#withValidationActionsMixin':: d.fn(help="\"validationActions declares how Validations of the referenced ValidatingAdmissionPolicy are enforced. If a validation evaluates to false it is always enforced according to these actions.\\n\\nFailures defined by the ValidatingAdmissionPolicy's FailurePolicy are enforced according to these actions only if the FailurePolicy is set to Fail, otherwise the failures are ignored. This includes compilation errors, runtime errors and misconfigurations of the policy.\\n\\nvalidationActions is declared as a set of action values. Order does not matter. validationActions may not contain duplicates of the same action.\\n\\nThe supported actions values are:\\n\\n\\\"Deny\\\" specifies that a validation failure results in a denied request.\\n\\n\\\"Warn\\\" specifies that a validation failure is reported to the request client in HTTP Warning headers, with a warning code of 299. Warnings can be sent both for allowed or denied admission responses.\\n\\n\\\"Audit\\\" specifies that a validation failure is included in the published audit event for the request. The audit event will contain a `validation.policy.admission.k8s.io/validation_failure` audit annotation with a value containing the details of the validation failures, formatted as a JSON list of objects, each with the following fields: - message: The validation failure message string - policy: The resource name of the ValidatingAdmissionPolicy - binding: The resource name of the ValidatingAdmissionPolicyBinding - expressionIndex: The index of the failed validations in the ValidatingAdmissionPolicy - validationActions: The enforcement actions enacted for the validation failure Example audit annotation: `\\\"validation.policy.admission.k8s.io/validation_failure\\\": \\\"[{\\\"message\\\": \\\"Invalid value\\\", {\\\"policy\\\": \\\"policy.example.com\\\", {\\\"binding\\\": \\\"policybinding.example.com\\\", {\\\"expressionIndex\\\": \\\"1\\\", {\\\"validationActions\\\": [\\\"Audit\\\"]}]\\\"`\\n\\nClients should expect to handle additional values by ignoring any values not recognized.\\n\\n\\\"Deny\\\" and \\\"Warn\\\" may not be used together since this combination needlessly duplicates the validation failure both in the API response body and the HTTP warning headers.\\n\\nRequired.\"\n\n**Note:** This function appends passed data to existing values", args=[d.arg(name='validationActions', type=d.T.array)]),
  withValidationActionsMixin(validationActions): { validationActions+: if std.isArray(v=validationActions) then validationActions else [validationActions] },
  '#mixin': 'ignore',
  mixin: self,
}
