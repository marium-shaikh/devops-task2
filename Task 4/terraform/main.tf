terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "app" {
  metadata {
    name = "devops-app"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "devops-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "devops-app"
        }
      }

      spec {
        container {
          name  = "devops-app"
          image = "devops-task2-app:latest"
          image_pull_policy = "IfNotPresent"

          port {
            container_port = 3000
          }
          resources {
  requests = {
    cpu    = "100m"
    memory = "128Mi"
  }

  limits = {
    cpu    = "500m"
    memory = "256Mi"
  }
}
        }
      }
    }
  }
}
resource "kubernetes_service" "app" {
  metadata {
    name = "devops-app-service"
  }

  spec {
    selector = {
      app = "devops-app"
    }

    port {
      port        = 3000
      target_port = 3000
    }

    type = "NodePort"
  }
}
resource "kubernetes_persistent_volume_claim" "app_storage" {
  metadata {
    name = "devops-app-pvc"
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}
resource "kubernetes_ingress_v1" "app" {
  metadata {
    name = "devops-app-ingress"
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.app.metadata[0].name

              port {
                number = 3000
              }
            }
          }
        }
      }
    }
  }
}
resource "kubernetes_horizontal_pod_autoscaler_v2" "app" {
  metadata {
    name = "devops-app-hpa"
  }

  spec {
    min_replicas = 2
    max_replicas = 5

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = kubernetes_deployment.app.metadata[0].name
    }

    metric {
      type = "Resource"

      resource {
        name = "cpu"

        target {
          type                = "Utilization"
          average_utilization = 70
        }
      }
    }
  }
}