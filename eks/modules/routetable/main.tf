resource "aws_eip" "nat" {
  count = var.count_az
  vpc   = true
  tags = {
    Name = "nat-az-${count.index}"
  }
}

resource "aws_nat_gateway" "nat" {
  count         = var.count_az
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnet[count.index]
  tags = {
    Name = "nat-gw-${count.index}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.app_name}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-rt"
  }
}


resource "aws_route_table_association" "public_subnet" {
  count          = var.count_az
  subnet_id      = var.public_subnet[count.index]
  route_table_id = aws_route_table.public.id
}





resource "aws_route_table" "private" {
  count  = var.count_az
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat[count.index].id
  }
  tags = {
    Name = "private-rt-az-${count.index}"
  }
}



resource "aws_route_table_association" "private_subnet" {
  count          = var.count_az
  subnet_id      = var.private_subnet[count.index]
  route_table_id = aws_route_table.private[count.index].id
}