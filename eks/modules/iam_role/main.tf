resource "aws_iam_role" "roles" {
  name = var.role_name
  assume_role_policy = file("./files/${var.sts_assume_role}-assume-role.json")
}

