resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = var.database_subnets

  tags = {
    Name = "main-subnet-group"
  }
}

resource "aws_db_instance" "main" {
  identifier              = "mydb"
  engine                  = "mysql"
  instance_class          = var.db_instance_class
  allocated_storage       = 20
  db_name                 = var.db_name
  username                = var.db_user
  password                = var.db_password
  multi_az                = true
  storage_type            = "gp2"
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [var.db_sg_id]

  tags = {
    Name = "mydb-instance"
  }
}
