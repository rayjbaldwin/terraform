variable "public_subnet_cidr_block" {
  type        = list(string)
 description = "Public subnet CIDR blocks"
 default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr_block" {
  type        = list(string)
 description = "Private subnet CIDR blocks"
 default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
