# AWS EC2 Instance 
resource "aws_instance" "ecommerce-web-server" {
  ami                    = "ami-00eeedc4036573771"
  instance_type          = "t2.micro"
  key_name               = "ohio"
  subnet_id              = aws_subnet.ecommerce-subnet.id
  vpc_security_group_ids = [aws_security_group.ecommerce-web-sg.id]
  user_data              = file("web.sh")
  tags = {
    Name = "ecommerce web server"
  }
}
