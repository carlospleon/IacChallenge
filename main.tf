  backend "remote" {

    hostname     = "app.terraform.io"

    organization = "salomon"



    workspaces {

      name = "iacChallenge"

    }

  }

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  tag_vpc    = "Iac_VPC"
}

module "gateway" {
  source = "./modules/gateway"
  vpc_id = module.vpc.id
}

module "rtable" {
  source         = "./modules/rtable"
  gateway_id     = module.gateway.id
  vpc_id         = module.vpc.id
  subnet_id      = module.subnet.id
  route_table_id = module.rtable.id
}

module "subnet" {
  source   = "./modules/subnet"
  vpc_id   = module.vpc.id
  ippublic = true
}

module "network_interface" {
  source      = "./modules/network"
  private_ips = ["10.0.1.10"]
  subnet_id   = module.subnet.id
  security    = [module.security.id]
}

module "security" {
  source      = "./modules/security group"
  name        = "IaC_SG"
  description = "IaC Challenge Security Group"
  vpc_id      = module.vpc.id
  cidr_block  = ["0.0.0.0/0"]
}

module "instance" {
  source               = "./modules/instance"
  instance_type        = "t2.micro"
  ami                  = "ami-0c02fb55956c7d316"
  network_interface_id = module.network_interface.id
  security             = [module.security.id]
}