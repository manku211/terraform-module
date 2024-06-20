resource "aws_instance" "web_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_size
  key_name      = "ssh-pair"

  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_id
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
  tags = {
    Name        = "ec2-${var.infra_env}-web"
  }

}  