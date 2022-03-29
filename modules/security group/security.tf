resource "aws_security_group" "IacSG" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "Public_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = var.cidr_block
  security_group_id = aws_security_group.IacSG.id
}

resource "aws_security_group_rule" "Public_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.cidr_block
  security_group_id = aws_security_group.IacSG.id
}

resource "aws_security_group_rule" "Public_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.cidr_block
  security_group_id = aws_security_group.IacSG.id
}

resource "aws_security_group_rule" "Private_in" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = var.cidr_block
  security_group_id = aws_security_group.IacSG.id
}