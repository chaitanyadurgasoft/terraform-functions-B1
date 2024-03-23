resource "aws_security_group" "webserver" {
  vpc_id      = aws_vpc.terraformb1.id
  description = "allow web access"
  name        = "webaccess"
  tags = {
    Name = "Webaccess"
  }
  dynamic "ingress" {
    for_each = local.ingress_rules1
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "appserver" {
  vpc_id      = aws_vpc.terraformb1.id
  description = "allow application access"
  name        = "appaccess"
  tags = {
    Name = "appaccess"
  }
  dynamic "ingress" {
    for_each = local.ingress_rules2
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "DBserver" {
  vpc_id      = aws_vpc.terraformb1.id
  description = "allow database access"
  name        = "DBaccess"
  tags = {
    Name = "DBaccess"
  }
  dynamic "ingress" {
    for_each = local.ingress_rules3
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}