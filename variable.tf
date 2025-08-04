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
variable "index_filename" {
  type = string
}
variable "function_folder_name" {
  type = string
}
variable "runtime" {
  type = string
}
variable "role_name_start" {
  type = string
}
variable "role_name_stop" {
  type= string
}
variable "first_function" {
  type = string
}
variable "second_function" {
  type = string
}
# variable "time" {}
variable "start_instance_time" {
  type = string
}
variable "stop_instance_time" {
  type = string
}