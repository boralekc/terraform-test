output "cluster_name" {
  value = yandex_kubernetes_cluster.k8s-master.name
}

output "kubeconfig" {
  value = yandex_kubernetes_cluster.k8s-master.kube_config.0.raw_config
}
