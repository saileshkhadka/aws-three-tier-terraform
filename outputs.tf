output "web_instance_public_ip" {
  value = module.ec2.web_instance_public_ip
}

output "app_instance_private_ip" {
  value = module.ec2.app_instance_private_ip
}

output "database_endpoint" {
  value = module.rds.database_endpoint
}

output "load_balancer_dns" {
  value = module.alb.load_balancer_dns
}
