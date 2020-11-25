resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.${count.index + 2}.0/24"
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones.*, count.index % length(var.availability_zones))

  tags = {
    Name  = var.name
    Owner = var.owner
  }
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name  = var.name
    Owner = var.owner
  }
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.name
  }
}
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }


  tags = {
    Name = var.name
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.0.id
  route_table_id = aws_route_table.main.id
}