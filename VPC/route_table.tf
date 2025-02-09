# Route table for Private Subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT.id
  }
  tags = {
    Name = var.private_route_table_name
  }
}
# Route table Association to Private Subnet
resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}


# NAT Gateway in Public Subnet
resource "aws_eip" "nat" {
  domain = "vpc"
}
resource "aws_nat_gateway" "NAT" {
  subnet_id     = aws_subnet.public_subnet.id
  allocation_id = aws_eip.nat.id
  depends_on    = [aws_internet_gateway.IGW]
  tags = {
    Name = var.nat_gateway_name
  }
}


# Route table for Public Subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  # IPV4
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  # IPV6
  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.egress.id
  }
  tags = {
    Name = var.public_route_table_name
  }
}
# Route table Association to Public Subnet
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}