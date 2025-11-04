variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "db_username" {
  default = "postgres"
}

variable "db_password" {
  default = "postgres123"
  sensitive = true
}

variable "db_name" {
  default = "testdb"
}

variable "app_image" {
  description = "ECR image for backend"
  default = "975050276645.dkr.ecr.us-east-1.amazonaws.com/backend-app:latest"
}
