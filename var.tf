variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the VPC"
  type        = string
}

variable "pub_subnet_cidr" {
  description = "CIDR of public subnet"
  type        = list(string)
}

variable "subnet_az" {
  description = "AZ for public subnet"
  type        = list(string)
}

variable "pri_subnet_cidr" {
  description = "CIDR of private subnet"
  type        = list(string)
}

variable "pub_subnet_name" {
  description = "Name tag of the pub subnet name"
  type        = list(string)
}

variable "pri_subnet_name" {
  description = "Name tag of the pri subnet name"
  type        = list(string)
}
