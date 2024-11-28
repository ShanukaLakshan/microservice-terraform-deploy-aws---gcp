terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}
resource "docker_image" "user_microservice_tf_docker_image" {
  name = local.docker_image_url
  build {
    context  = abspath("${path.root}/../src/")
    platform = "linux/amd64"

  }
}

resource "docker_registry_image" "user_microservice_tf_registry_image" {
  name          = docker_image.user_microservice_tf_docker_image.name
  keep_remotely = true
  depends_on    = [docker_image.user_microservice_tf_docker_image]
}


resource "google_cloud_run_service" "user_microservice_tf_cloud_run_service" {
  name     = var.image_name
  location = var.region

  template {
    spec {
      containers {
        image = docker_registry_image.user_microservice_tf_registry_image.name
        ports {
          container_port = var.port
        }

      }
      timeout_seconds = 300
    }
  }

  depends_on = [docker_registry_image.user_microservice_tf_registry_image]
}
