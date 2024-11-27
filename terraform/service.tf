resource "docker_image" "user_microservice_tf_docker_image" {
  # Local image name = "${var.region}-docker.pkg.dev/steady-course-442905-f1/user-microservice-tf-repository/user-microservice-tf-docker-image"
  name = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.user_microservice_tf_registry.name}/user-microservice-tf:latest"
  build {
    path = "../"
  }
}

resource "google_artifact_registry_repository" "user_microservice_tf_registry" {
  repository_id = "user-microservice-tf-registry"
  location      = var.region
  format        = "DOCKER"
}

resource "docker_registry_image" "user_microservice_tf_registry_image" {
  name          = docker_image.user_microservice_tf_docker_image.name
  keep_remotely = true
  depends_on    = [docker_image.user_microservice_tf_docker_image, google_artifact_registry_repository.user_microservice_tf_registry]
}


resource "google_cloud_run_service" "user_microservice_tf_cloud_run_service" {
  name     = "user-microservice-tf-cloud-run-service"
  location = var.region

  template {
    spec {
      containers {
        image = docker_registry_image.user_microservice_tf_registry_image.name
      }
    }
  }
  depends_on = [docker_registry_image.user_microservice_tf_registry_image]
}
