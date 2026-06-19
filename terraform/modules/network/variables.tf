variable "name" {
  type = string
}

variable "cidr" {
  type = string
}

variable "azs" {
  description = "AZs onde as subnets são distribuídas."
  type        = list(string)
}
