#creation of subnet
resource "aws_subnet" "lms-subnet" {
  vpc_id                  = aws_vpc.lms.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "lms-subnet"
  }
}
