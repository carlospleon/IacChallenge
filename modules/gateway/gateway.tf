resource "aws_internet_gateway" "iac_gateway" {
  vpc_id = var.vpc_id
}