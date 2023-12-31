output "vpc_public_subnets" {
  value = [for subnet in aws_subnet.public : subnet.id]
}

output "vpc_private_subnets" {
  value = [for subnet in aws_subnet.private : subnet.id]
}