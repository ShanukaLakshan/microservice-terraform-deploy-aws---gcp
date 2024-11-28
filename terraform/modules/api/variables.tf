variable "project_id" {
  description = "The ID of the project in which to create resources."
  type        = string
  default     = "steady-course-442905-f1"
}

variable "region" {
  description = "The region in which to create resources."
  type        = string
  default     = "asia-south1"
}

variable "registry_name" {
  description = "The name of the Artifact Registry repository to create."
  type        = string
  default     = "user-microservice-tf-registry"
}

variable "image_name" {
  description = "The name of the image to create."
  type        = string
  default     = "user-microservice-tf"
}

variable "port" {
  description = "The port on which the container listens."
  type        = number
  default     = 5000
}

