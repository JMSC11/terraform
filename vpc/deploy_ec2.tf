resource "aws_instance" "my_first_terraform_ec2" {
  ami           = "ami-02f28de77fa0736c9"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "My_First_Terraform_EC2"
  }
}