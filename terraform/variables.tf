variable "cluster_name" {
  type        = string
  description = "Name used for cluster"
  default     = "argocdmanagedstartercluster"
}

variable "tags" {
  type        = map(string)
  description = "Default tags for all resources"
  default = {
    Environment = "Sample"
  }
}
