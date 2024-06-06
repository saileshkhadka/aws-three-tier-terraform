provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source  = "./modules/security_groups"
  vpc_id  = module.vpc.vpc_id
  vpc_cidr = module.vpc.vpc_cidr
}

module "ec2" {
  source          = "./modules/ec2"
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  web_sg_id       = module.security_groups.web_sg_id
  app_sg_id       = module.security_groups.app_sg_id
}

module "alb" {
  source         = "./modules/alb"
  public_subnets = module.vpc.public_subnets
  web_sg_id      = module.security_groups.web_sg_id
}

module "rds" {
  source             = "./modules/rds"
  database_subnets   = module.vpc.database_subnets
  db_sg_id           = module.security_groups.db_sg_id
  db_name            = var.db_name
  db_user            = var.db_user
  db_password        = var.db_password
  db_instance_class  = var.db_instance_class
}
