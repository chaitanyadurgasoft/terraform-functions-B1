resource "aws_vpc" "terraformb1" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}
resource "aws_internet_gateway" "terraformb1-IGW" {
  vpc_id = aws_vpc.terraformb1.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}