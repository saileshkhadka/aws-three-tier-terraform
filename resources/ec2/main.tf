resource "aws_launch_configuration" "web" {
  name          = "web-launch-configuration"
  image_id      = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = var.instance_type
  security_groups = [var.web_sg_id]

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Welcome to Web Server</h1>" | sudo tee /var/www/html/index.html
              EOF
}

resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web.id
  vpc_zone_identifier  = var.public_subnets
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2
  health_check_type    = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }
}

resource "aws_instance" "app" {
  ami             = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type   = var.instance_type
  subnet_id       = element(var.private_subnets, 0)
  security_groups = [var.app_sg_id]

  tags = {
    Name = "app-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y tomcat
              sudo systemctl start tomcat
              sudo systemctl enable tomcat
              EOF
}
