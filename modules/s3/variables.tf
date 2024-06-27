variable "bucket_name" {
  description = "Folder ID where resources will be created"
  type        = string
  default     = "s3-state"  
}

variable "CLOUD_ID" {
  description = "Cloud id"
}

variable "FOLDER_ID" {
  description = "Folder id"
}

variable "YC_TOKEN" {
  description = "Secret key"
}

variable "ACCESS_KEY" {
  type = string
}

variable "SECRET_KEY" {
  type = string
}