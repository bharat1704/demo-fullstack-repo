resource "aws_db_subnet_group" "default" {
  name       = "test-db-subnet"
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.public_b.id]  # ✅ two subnets in two AZs
  tags = { Name = "test-db-subnet" }
}

resource "aws_db_instance" "default" {
  identifier              = "test-db"
  engine                  = "postgres"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = "postgres"
  password                = "postgres"
  db_subnet_group_name    = aws_db_subnet_group.default.name
  publicly_accessible     = true
  skip_final_snapshot     = true
}
