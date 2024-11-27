
resource "google_artifact_registry_repository" "user_microservice_tf_registry_repository" {
  repository_id = "user-microservice-tf-repository"
  location      = "asia-south1"
  format        = "DOCKER"
}

resource "docker_registry_image" "user_microservice_tf_registry_image" {
  name          = docker_image.user_microservice_tf_docker_image.name
  keep_remotely = true
}

resource "docker_image" "user_microservice_tf_docker_image" {
  name = "asia-south1-docker.pkg.dev/steady-course-442905-f1/user-microservice-tf-repository/user-microservice-tf-docker-image"
  build {
    path = "../"
    tag  = ["user-microservice-tf:latest"]
  }
}
