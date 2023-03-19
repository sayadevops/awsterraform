# Route Tables
resource "aws_route_table" "lms_rtb" {
  vpc_id = aws_vpc.lms.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lms_igw.id
  }

  tags = {
    Name = "lms-rtb"
  }
}