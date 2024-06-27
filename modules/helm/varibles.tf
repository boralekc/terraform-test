variable "folder_id" {
  description = "Folder ID where resources will be created"
  type        = string
}

variable "kubernetes_api" {
  description = "Kubernetes cluster API server host"
}

variable "kubernetes_token" {
  description = "Kubernetes service account token"
}