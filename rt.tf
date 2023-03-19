# Route Tables
resource "aws_route_table" "ecommerce_rtb" {
  vpc_id = aws_vpc.ecommerce.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ecommerce_igw.id
  }

  tags = {
    Name = "ecommerce-rtb"
  }
}