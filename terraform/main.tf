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
provider "google" {
  project = var.project_id
  region  = var.region
}

# you can get current google_client_config by running `gcloud auth application-default login` or default credentials
data "google_client_config" "default" {}

provider "docker" {
  registry_auth {
    address  = "${var.region}-docker.pkg.dev"
    username = "oauth2accesstoken"
    password = data.google_client_config.default.access_token
  }
}

resource "google_artifact_registry_repository" "user_microservice_tf_registry" {
  repository_id = "user-microservice-tf-registry"
  location      = var.region
  format        = "DOCKER"
}

module "api1" {
  source        = "./modules/api"
  image_name    = "user-microservice-tf-dev"
  port          = 5000
  project_id    = var.project_id
  region        = var.region
  registry_name = google_artifact_registry_repository.user_microservice_tf_registry.name
}

# module "api2" {
#   source        = "./modules/api"
#   image_name    = "user-microservice-tf-prod"
#   port          = 8080
#   project_id    = var.project_id
#   region        = var.region
#   registry_name = google_artifact_registry_repository.user_microservice_tf_registry.name
# }
