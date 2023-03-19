# Internet Gateway
resource "aws_internet_gateway" "ecommerce_igw" {
  vpc_id = aws_vpc.ecommerce.id

  tags = {
    Name = "ecommerce-igw"
  }
}

