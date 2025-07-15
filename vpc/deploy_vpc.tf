resource "aws_vpc" "my_first_terraform_vpc" {
  cidr_block = var.mex_cidr
  tags = {
    Name = "My first tf vpc"
  }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.my_first_terraform_vpc.id
    cidr_block = var.subnets[0]
    map_public_ip_on_launch = true
    tags = {
        Name = "Public Sunbet"
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.my_first_terraform_vpc.id
    cidr_block = var.subnets[1]  
    tags = {
        Name = "Private Sunbet"
    }
}

resource "aws_vpc" "my_second_terraform_vpc" {
  cidr_block = var.mex_second_cidr
  tags = {
    Name = "My first tf vpc"
  }
}

resource "aws_subnet" "second_private_subnet" {
    vpc_id = aws_vpc.my_second_terraform_vpc.id
    cidr_block = var.subnets[2]  
    tags = {
        Name = "Private Sunbet"
    }
}


resource "aws_route" "route_to_vpc_b" {
  route_table_id         = data.aws_route_table.vpc_a_rt.id
  destination_cidr_block = var.mex_second_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

resource "aws_route" "route_to_vpc_a" {
  route_table_id         = data.aws_route_table.vpc_b_rt.id
  destination_cidr_block = var.mex_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}