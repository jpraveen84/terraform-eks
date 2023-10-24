variable "vpc_id" {
  type = string
}

variable "count_az" {
  type = number
}

variable "public_subnet" {
  type = list(any)
}

variable "private_subnet" {
  type = list(any)
}

variable "app_name" {
  type = string
}
