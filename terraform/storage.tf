
resource "google_storage_bucket" "user_microservice_cloud_storage_bucket" {
  # Bucket Name: user-microservice-bucket-test
  name = "user-microservice-bucket-test"
  # The bucket is created in this region [asia-south1]
  location      = "asia-south1"
  force_destroy = true

  # Soft delete disabled
  soft_delete_policy {
    retention_duration_seconds = 0
  }
}
