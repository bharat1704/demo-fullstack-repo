output "vpc_id" {
  value = aws_vpc.main.id
}


# Subnet Outputs
output "public_subnet_a_id" {
  value = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  value = aws_subnet.public_b.id
}


# RDS Outputs
output "db_endpoint" {
  value = aws_db_instance.default.address
}

output "db_name" {
  value = aws_db_instance.default.name
}


output "ecs_cluster_name" {
  value = aws_ecs_cluster.backend_cluster.name
}
