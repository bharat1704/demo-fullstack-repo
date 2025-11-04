#####################################
# Subnets for RDS
#####################################


# Public Subnet B (in AZ 1b)
resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "public-subnet-b"
  }
}

#####################################
# RDS Subnet Group
#####################################

resource "aws_db_subnet_group" "default" {
  name       = "test-db-subnet"
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.public_b.id]  # ✅ two subnets in two AZs
  tags = {
    Name = "test-db-subnet"
  }
}

#####################################
# PostgreSQL RDS Instance
#####################################

resource "aws_db_instance" "default" {
  identifier              = "test-db"
  engine                  = "postgres"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = "postgres"
  password                = "postgres"
  db_subnet_group_name    = aws_db_subnet_group.default.name
  publicly_accessible     = false
  skip_final_snapshot     = true

  tags = {
    Name = "test-db-instance"
  }
}
