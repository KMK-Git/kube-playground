module "argocd_pod_identity" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity?ref=f39ff40fd4f45d61dda0b1a26cb82e1a005e2417"

  name            = "PodIdentityTest"
  use_name_prefix = false

  trust_policy_conditions = [
    {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    },
    {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [data.aws_eks_cluster.cluster.arn]
    }
  ]

  associations = {
    controller = {
      cluster_name    = data.aws_eks_cluster.cluster.name
      namespace       = "awsauthtest"
      service_account = "podidentitytest"
    }
  }
}

module "controller_role" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-role-for-service-accounts-eks?ref=89fe17a6549728f1dc7e7a8f7b707486dfb45d89"

  role_name = "IRSATest"

  oidc_providers = {
    main = {
      provider_arn               = data.aws_iam_openid_connect_provider.cluster_oidc.arn
      namespace_service_accounts = ["awsauthtest:irsatest"]
    }
  }
}

module "irsa_service_account" {
  source                = "../modules/eksserviceaccount"
  account_id            = data.aws_caller_identity.current.account_id
  name_prefix           = ""
  oidc_provider_arn     = data.aws_iam_openid_connect_provider.cluster_oidc.arn
  partition             = data.aws_partition.current.partition
  role_name             = "IRSATest"
  namespace             = "awsauthtest"
  service_account_names = ["irsatest"]
}
