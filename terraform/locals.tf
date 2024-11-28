locals {
  #   docker_image_name = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.user_microservice_tf_registry.name}/user-microservice-tf:${formatdate("YYYYMMDDHHmmss", timestamp())}"
  docker_image_name = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.user_microservice_tf_registry.name}/user-microservice-tf:latest"
}
