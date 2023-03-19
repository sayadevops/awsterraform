#creation of subnet
resource "aws_subnet" "ecommerce-subnet" {
  vpc_id                  = aws_vpc.ecommerce.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "ecommerce-subnet"
  }
}
