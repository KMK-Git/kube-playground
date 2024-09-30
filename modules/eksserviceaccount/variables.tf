variable "account_id" {
  description = "AWS account ID"
  type        = string
}

variable "dynamic_chart_options" {
  description = "List of additional options that need to be passed to service account Helm chart"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "namespace" {
  description = "Namespace in which service account will be created"
  type        = string
  default     = "kube-system"
}

variable "name_prefix" {
  description = "Prefix used for resource names"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN for OIDC provider associated with EKS cluster"
  type        = string
}

variable "partition" {
  description = "AWS partition"
  type        = string
}

variable "role_name" {
  description = "Name of IAM role created for service account"
  type        = string
}

variable "service_account_names" {
  description = "List of names for service account"
  type        = list(string)
}
