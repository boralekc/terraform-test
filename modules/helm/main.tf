provider "kubernetes" {
  host              = var.kubernetes_api
  token             = var.kubernetes_token
}

resource "kubernetes_manifest" "install_helm" {
  manifest = yamldecode(file("${path.module}/install-helm.yaml"))
}
