variable "region" {
  description = "Região AWS onde a infra é criada."
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Prefixo de nome dos recursos."
  type        = string
  default     = "platform"
}

variable "environment" {
  type    = string
  default = "staging"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "cluster_version" {
  description = "Versão do Kubernetes no EKS."
  type        = string
  default     = "1.30"
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t3.large"]
}

variable "node_min_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 4
}

variable "node_desired_size" {
  type    = number
  default = 2
}
