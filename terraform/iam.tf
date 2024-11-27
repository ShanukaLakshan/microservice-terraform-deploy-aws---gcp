data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.user_microservice_tf_cloud_run_service.location
  project  = google_cloud_run_service.user_microservice_tf_cloud_run_service.project
  service  = google_cloud_run_service.user_microservice_tf_cloud_run_service.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
