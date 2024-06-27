variable "folder_id" {
  description = "Folder ID where resources will be created"
  type        = string
}

variable "kubernetes_cluster_host" {
  description = "Kubernetes cluster API server host"
}

variable "kubernetes_cluster_token" {
  description = "Kubernetes service account token"
}