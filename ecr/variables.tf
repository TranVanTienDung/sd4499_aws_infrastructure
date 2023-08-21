variable "project" {
  type        = string
  default     = ""
  description = "Project name"
}

variable "owner" {
  type        = string
  default     = ""
  description = "Owner name"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "name" {
  type        = string
  default     = ""
  description = "Name of the application"
}