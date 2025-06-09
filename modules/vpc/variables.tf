variable "project_name" {
  description = "stocktraderAPI"
  type = string
}

variable "environment" {
  description = "The deployment environment (Dev, Staging, Prod)"
  type = string
}

variable "vpc_cidr_block"{
  description = "The CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "The availability zones in a region"
  type = list(string)
}

variable "public_subnet_cidr_block" {
  description = "A list of subnets for the public subnet"
  type = list(string)

  validation {
    condition = length(availability_zones) == length(public_subnet_cidr_block)
    error_message = "The number of availability zones must match the number of public subnets"
  }
}

variable "private_subnet_cidr_block" {
  description = "A list of subnets for the private subnet"
  type = list(string)

  validation {
    condition = length(availability_zones) == length(private_subnet_cidr_block)
    error_message = "The number of availability zones must match the number of private subnets"
  }
}