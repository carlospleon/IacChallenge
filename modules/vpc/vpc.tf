resource "aws_vpc" "Iac_VPC" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  tags = {
    Name = var.tag_vpc
  }
}
