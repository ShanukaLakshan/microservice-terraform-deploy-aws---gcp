# resource "docker_image" "user_microservice_tf_docker_image" {
#   name = local.docker_image_name
#   build {
#     path = "../src/"
#   }
# }

# resource "google_artifact_registry_repository" "user_microservice_tf_registry" {
#   repository_id = "user-microservice-tf-registry"
#   location      = var.region
#   format        = "DOCKER"
# }

# resource "docker_registry_image" "user_microservice_tf_registry_image" {
#   name          = docker_image.user_microservice_tf_docker_image.name
#   keep_remotely = true
#   depends_on    = [docker_image.user_microservice_tf_docker_image, google_artifact_registry_repository.user_microservice_tf_registry]
# }


# resource "google_cloud_run_service" "user_microservice_tf_cloud_run_service" {
#   name     = "user-microservice-tf-cloud-run-service"
#   location = var.region

#   template {
#     spec {
#       containers {
#         image = docker_registry_image.user_microservice_tf_registry_image.name
#         ports {
#           container_port = 8080
#         }
#       }
#     }
#   }
#   depends_on = [docker_registry_image.user_microservice_tf_registry_image]
# }

# resource "google_cloud_run_v2_service" "user_microservice_tf_cloud_run_service" {
#   name                = "user-microservice-tf-cloud-run-service"
#   location            = var.region
#   deletion_protection = false
#   ingress             = "INGRESS_TRAFFIC_ALL"
#   template {
#     containers {
#       image = docker_registry_image.user_microservice_tf_registry_image.name
#     }
#   }
# }
