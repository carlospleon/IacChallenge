resource "aws_instance" "Iac_challenge" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "devops_rampup"
  network_interface {
    network_interface_id = var.network_interface_id
    device_index         = 0
  }

  tags = {
    Name = "IaC_Challenge"
  }
  
}