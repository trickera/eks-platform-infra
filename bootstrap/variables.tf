variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project" {
  type    = string
  default = "platform"
}

variable "state_bucket_name" {
  description = "Nome do bucket de state. É global na AWS, ajuste se já existir."
  type        = string
  default     = "platform-terraform-state"
}

variable "lock_table_name" {
  type    = string
  default = "platform-terraform-locks"
}
