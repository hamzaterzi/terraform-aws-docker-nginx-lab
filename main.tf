provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "web_sg" {
  name = "web-sg"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0e872aee57663ae2d"
  instance_type = "t2.micro"
  key_name      = "devops-key"   # kendi keypair adın

  security_groups = [aws_security_group.web_sg.name]

  user_data = file("user-data.sh")

  tags = {
    Name = "terraform-docker-nginx"
  }
}

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}

output "public_ip" {
  value = aws_eip.web_ip.public_ip
}

output "ssh_command" {
  value = "ssh -i devops-key.pem ubuntu@${aws_eip.web_ip.public_ip}"
}
