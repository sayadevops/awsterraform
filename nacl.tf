# NACL
resource "aws_network_acl" "ecommerce-nacl" {
  vpc_id = aws_vpc.ecommerce.id
  tags = {
    Name = "ecommerce-nacl"
  }
}

# NACL Rules - Inbound
resource "aws_network_acl_rule" "ecommerce-ingress" {
  network_acl_id = aws_network_acl.ecommerce-nacl.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65535
}

# NACL Rules - Outbound
resource "aws_network_acl_rule" "ecommerce-egress" {
  network_acl_id = aws_network_acl.ecommerce-nacl.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65535
}

# NACL - Subnet - Association
resource "aws_network_acl_association" "nacl-subnet" {
  network_acl_id = aws_network_acl.ecommerce-nacl.id
  subnet_id      = aws_subnet.ecommerce-subnet.id
}