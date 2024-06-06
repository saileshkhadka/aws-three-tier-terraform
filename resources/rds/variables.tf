variable "database_subnets" {
  description = "List of database subnet IDs"
  type        = list(string)
}

variable "db_sg_id" {
  description = "Security Group ID for the database"
}

variable "db_name" {
  description = "Database name"
}

variable "db_user" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
}

variable "db_instance_class" {
  description = "Database instance class"
}
