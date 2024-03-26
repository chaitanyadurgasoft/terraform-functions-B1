resource "aws_subnet" "public_subnet" {
  count             = length(var.publicsubnet_cidr)
  vpc_id            = aws_vpc.terraformb1.id
  cidr_block        = element(var.publicsubnet_cidr, count.index)
  availability_zone = element(var.az, count.index)
  tags = {
    Name = "${var.vpc_name}-PublicSubnet-${count.index + 1}"
  }
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  count             = 3 #0 1 2
  vpc_id            = aws_vpc.terraformb1.id
  cidr_block        = element(var.privatesubnet_cidr, count.index)
  availability_zone = element(var.az, count.index)
  tags = {
    Name = "${var.vpc_name}-PrivateSubnet-${count.index + 1}"
  }

}

