# Internet Gateway
resource "aws_internet_gateway" "lms_igw" {
  vpc_id = aws_vpc.lms.id

  tags = {
    Name = "lms-igw"
  }
}

