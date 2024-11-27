terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.12.0"
    }
  }
}

provider "google" {
  project = "steady-course-442905-f1"
  region  = "asia-south1"
}
