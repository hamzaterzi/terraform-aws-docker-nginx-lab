# Terraform AWS Docker Nginx Lab

This project provisions AWS infrastructure using Terraform and automatically deploys a Dockerized Nginx web server on an EC2 instance using user data.

## Architecture
Terraform → AWS EC2 → Docker → Nginx Container → Website

## Resources Created
- EC2 Instance (Ubuntu)
- Security Group (SSH and HTTP)
- Elastic IP
- Docker installation via user data
- Nginx container auto deployment

## How to Use

```bash
terraform init
terraform plan
terraform apply

           Terraform
               |
               v
        +--------------+
        |   AWS EC2    |
        |   (Ubuntu)   |
        +--------------+
               |
          User Data
               |
               v
            Docker
               |
               v
         Nginx Container
               |
               v
            Website
