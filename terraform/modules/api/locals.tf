locals {
  docker_image_url = "${var.region}-docker.pkg.dev/${var.project_id}/${var.registry_name}/${var.image_name}:latest"
}
