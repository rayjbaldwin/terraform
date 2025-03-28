variable "public_subnet_cidr_block" {
  type        = list(string)
  description = "Public subnet CIDR blocks"
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "private_subnet_cidr_block" {
  type        = list(string)
  description = "Private subnet CIDR blocks"
  default     = ["10.0.13.0/24", "10.0.14.0/24"]
}

variable "instance1_name" {
  type        = string
  description = "Name for the first EC2 instance"
  default     = "instance 1"
}

variable "instance2_name" {
  type        = string
  description = "Name for the second EC2 instance"
  default     = "instance 2"
}