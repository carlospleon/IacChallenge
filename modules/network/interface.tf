resource "aws_network_interface" "Iac_Interface" {
  subnet_id   = var.subnet_id
  private_ips = var.private_ips
  security_groups = var.security
  tags = {
    Name = "Iac_network_interface"
  }
}