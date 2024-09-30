variable "cluster_name" {
  type        = string
  description = "Name used for cluster"
  default     = "argocdmanagedcluster"
}

variable "tags" {
  type        = map(string)
  description = "Default tags for all resources"
  default = {
    Environment = "Sample"
  }
}
