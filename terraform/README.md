<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.69.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.15.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_argocd_pod_identity"></a> [argocd\_pod\_identity](#module\_argocd\_pod\_identity) | git::https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity | f39ff40fd4f45d61dda0b1a26cb82e1a005e2417 |
| <a name="module_controller_role"></a> [controller\_role](#module\_controller\_role) | git::https://github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-role-for-service-accounts-eks | 89fe17a6549728f1dc7e7a8f7b707486dfb45d89 |

## Resources

| Name | Type |
|------|------|
| [helm_release.serviceaccount](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_iam_openid_connect_provider.cluster_oidc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_openid_connect_provider) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name used for cluster | `string` | `"argocdmanagedcluster"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags for all resources | `map(string)` | <pre>{<br>  "Environment": "Sample"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
