variable ec2_ami {
  type        = string
  default     = ""
  description = "The AMI to use for the EC2 instance"
}

variable ec2_instance_type {
  type        = string
  default     = ""
  description = "The type of EC2 instance to launch"
}

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