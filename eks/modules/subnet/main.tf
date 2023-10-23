data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count                   = var.count_az
  vpc_id                  = var.vpc_id
  cidr_block              = cidrsubnet(var.cidr, var.newbits, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-AZ-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count                   = var.count_az
  vpc_id                  = var.vpc_id
  cidr_block              = cidrsubnet(var.cidr, var.newbits, count.index + var.count_az)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet-AZ-${count.index}"
  }
}