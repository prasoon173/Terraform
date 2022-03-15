variable "bucket_name" {
  description = "Google Cloud Storage bucket name"
  type        = string
}

variable "project_id" {
  description = "Project id"
  type        = string
  #project_id  = "just-advice-335915"

}
variable "gcs_location" {
  description = "GCS Location"
  type        = string
  default     = "us-central1"

}

variable "zone" {
  description = "zone of the GCE instance"
  type        = string
  default     = "us-central1-a"

}

variable "machine_type" {
  description = "machine type of the instance"
  type        = string
  default     = "e2-medium"

}
variable "force_destroy" {
  description = "Delete all objects when deleting bucket"
  type        = bool
  default     = false

}
variable "storage_class" {
  description = "storage class of GCS bucket"
  type        = string
  default     = "STANDARD"

}
variable "enable_versioning" {
  description = "Enable GCS Bucket versioning"
  type        = bool
  default     = false

}