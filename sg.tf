# Security Group
resource "aws_security_group" "lms-web-sg" {
  name        = "allow-ssh-http"
  description = "Allow SSH & HTTP traffic"
  vpc_id      = aws_vpc.lms.id
  tags = {
    Name = "lms-web-sg"
  }
}

# Security Group Rules
resource "aws_security_group_rule" "lms-ssh-rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lms-web-sg.id
}

resource "aws_security_group_rule" "lms-http-rule" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lms-web-sg.id
}

resource "aws_security_group_rule" "lms-outbound-rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lms-web-sg.id
}