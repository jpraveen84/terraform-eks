# output "eks_role_arn" {
#     value = aws_iam_role.roles.arn
# }




output "role_arns" {
  value = [ for values in aws_iam_role.roles[*] : values.arn ]
}