variable "region" {
  type = string
}

variable "function_name" {
  type = string
}


variable "env" {
  description = "Environment type"
  type        = string
  default     = "production"
}

variable "log_level" {
  description = "Log verbosity"
  type        = string
  default     = "info"
}

variable "application" {
  description = "Application name"
  type        = string
  default     = "example"
}

variable "runtime" {
  type = string
}

variable "index_filename" {
  type = string
}

variable "function_folder_name" {
  type = string
}

variable "role_name" {
  type        = string
  description = "IAM role name for the Lambda function"
}
