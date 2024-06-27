provider "kubernetes" {
  host              = var.kubernetes_cluster_host
  token             = var.kubernetes_cluster_token
}

resource "kubernetes_namespace" "semaphore" {
  metadata {
    name = "semaphore"
  }
}

resource "kubernetes_secret" "semaphore-db-secret" {
  metadata {
    name      = "semaphore-db-secret"
    namespace = kubernetes_namespace.semaphore.metadata[0].name
  }
  data = {
    postgresql-user     = "c2VtYXBob3Jl"   # base64 encoded "semaphore"
    postgresql-password = "cGFzc3dvcmQ="  # base64 encoded "password"
  }
}

resource "kubernetes_deployment" "semaphore" {
  metadata {
    name      = "semaphore"
    namespace = kubernetes_namespace.semaphore.metadata[0].name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "semaphore"
      }
    }
    template {
      metadata {
        labels = {
          app = "semaphore"
        }
      }
      spec {
        container {
          name  = "semaphore"
          image = "semaphoreci/semaphore:latest"

          env {
            name  = "SEMAPHORE_DB_USER"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.semaphore-db-secret.metadata[0].name
                key  = "postgresql-user"
              }
            }
          }

          env {
            name  = "SEMAPHORE_DB_PASS"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.semaphore-db-secret.metadata[0].name
                key  = "postgresql-password"
              }
            }
          }

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "semaphore" {
  metadata {
    name      = "semaphore"
    namespace = kubernetes_namespace.semaphore.metadata[0].name
  }
  spec {
    selector = {
      app = "semaphore"
    }
    port {
      port        = 80
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}
