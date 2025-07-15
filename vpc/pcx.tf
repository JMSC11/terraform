resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id        = aws_vpc.my_first_terraform_vpc.id
  peer_vpc_id   = aws_vpc.my_second_terraform_vpc.id
  auto_accept   = true

  tags = {
    Name = "My First Terraform PCX"
  }
}