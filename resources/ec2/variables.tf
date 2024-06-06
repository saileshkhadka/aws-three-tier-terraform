variable "instance_type" {
  description = "Instance type for EC2 instances"
  default     = "t2.micro"
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "web_sg_id" {
  description = "Security Group ID for web instances"
}

variable "app_sg_id" {
  description = "Security Group ID for app instances"
}
