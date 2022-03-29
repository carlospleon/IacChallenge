resource "aws_instance" "Iac_challenge" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "devops_rampup"
  user_data            = <<-EOF
                      #! /bin/bash
                      yum update -y 
                      yum install httpd -y
                      cd /var/www/html 
                      echo "<html><body>Hola soy Carlos y esto es mi IaC Challenge (っ▀¯▀)つ  </body></html>" | tee -a index.html
                      service httpd start
                      chkconfig httpd on
                      EOF
  network_interface {
    network_interface_id = var.network_interface_id
    device_index         = 0
  }

  tags = {
    Name = "IaC_Challenge"
  }
  
}