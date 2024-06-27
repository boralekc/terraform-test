output "cluster_id" {
  value = yandex_kubernetes_cluster.k8s-master.id
}

output "cluster_name" {
  value = yandex_kubernetes_cluster.k8s-master.name
}

output "kubeconfig" {
  value = module.kubernetes.kubeconfig
}