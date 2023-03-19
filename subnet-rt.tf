# Route Table Association
resource "aws_route_table_association" "main_pub1_asc" {
  subnet_id      = aws_subnet.ecommerce-subnet.id
  route_table_id = aws_route_table.ecommerce_rtb.id
}
