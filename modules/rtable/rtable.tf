resource "aws_route_table" "rtable" {
  vpc_id = var.vpc_id
  
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }
  
}

resource "aws_route_table_association" "rtable" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
}