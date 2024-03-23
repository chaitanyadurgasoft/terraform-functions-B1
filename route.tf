resource "aws_route_table" "terraformb1-route" {
  vpc_id = aws_vpc.terraformb1.id
  tags = {
    Name = "${var.vpc_name}-PublicRoute"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraformb1-IGW.id
  }
}

resource "aws_route_table_association" "terraform_association_a" {
  count          = length(var.publicsubnet_cidr)
  route_table_id = aws_route_table.terraformb1-route.id
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)

}

resource "aws_route_table" "terraformb1-private-route" {
  vpc_id = aws_vpc.terraformb1.id
  tags = {
    Name = "${var.vpc_name}-PrivateRoute"
  }
}

resource "aws_route_table_association" "terraform_association_b" {
  count          = length(var.privatesubnet_cidr)
  route_table_id = aws_route_table.terraformb1-route.id
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)

}