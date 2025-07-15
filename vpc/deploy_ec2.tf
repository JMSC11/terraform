resource "aws_security_group" "first_ec2_sg" {
  name        = "first_ec2_sg"
  description = "Security group for first EC2 instance"
  vpc_id      = aws_vpc.my_first_terraform_vpc.id  

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "first_ec2_sg"
  }
}

resource "aws_security_group" "second_ec2_sg" {
  name        = "second_ec2_sg"
  description = "Security group for first EC2 instance"
  vpc_id      = aws_vpc.my_second_terraform_vpc.id  

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "second_ec2_sg"
  }
}

resource "aws_instance" "my_first_terraform_ec2" {
  ami           = "ami-02f28de77fa0736c9"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.private_subnet.id
  key_name = data.aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.first_ec2_sg.id]

  tags = {
    Name = "My_First_Terraform_EC2"
  }
}

resource "aws_instance" "my_second_terraform_ec2"{
  ami = "ami-02f28de77fa0736c9"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.second_private_subnet.id
  key_name = data.aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.second_ec2_sg.id]

  tags = {
    Name = "My_Second_Terraform_EC2"
  }
}