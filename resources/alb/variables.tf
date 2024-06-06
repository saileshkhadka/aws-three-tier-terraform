variable "vpc_id" {
  description = "VPC ID where the load balancer will be created"
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "web_sg_id" {
  description = "Security Group ID for the load balancer"
}

variable "autoscaling_group_name" {
  description = "Auto Scaling group name to attach to the load balancer"
}
