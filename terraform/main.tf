terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "google" {
  project = "steady-course-442905-f1"
  region  = "asia-south1"
}

# you can get current google_client_config by running `gcloud auth application-default login` or default credentials
data "google_client_config" "default" {}

provider "docker" {
  registry_auth {
    address  = "asia-south1-docker.pkg.dev"
    username = "oauth2accesstoken"
    password = data.google_client_config.default.access_token
  }

}
