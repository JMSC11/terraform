data "aws_key_pair" "key_pair" {
  key_name = "my_test_key"
}

data "aws_route_table" "vpc_a_rt" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.my_first_terraform_vpc.id]
  }

  filter {
    name   = "association.main"
    values = ["true"]
  }
}

data "aws_route_table" "vpc_b_rt" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.my_second_terraform_vpc.id]
  }

  filter {
    name   = "association.main"
    values = ["true"]
  }
}
