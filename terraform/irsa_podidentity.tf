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

# resource "helm_release" "serviceaccount" {
#   name             = "irsatest"
#   chart            = "${path.module}/../charts/eksserviceaccount"
#   namespace        = "awsauthtest"
#   version          = "0.1.0"
#   create_namespace = true

#   set {
#     name  = "aws.account.id"
#     value = data.aws_caller_identity.current.account_id
#   }

#   set {
#     name  = "aws.account.partition"
#     value = data.aws_partition.current.partition
#   }

#   set {
#     name  = "aws.role_name"
#     value = "IRSATest"
#   }

#   set {
#     name  = "serviceAccount.name"
#     value = "irsatest"
#   }
# }
