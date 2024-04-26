variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
  default     = "staging"
}

variable "cluster_config_path" {
  type        = string
  description = "Cluster's kubeconfig location"
  default     = "~/.kube/config"
}