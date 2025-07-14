output "ec2_public_ip" {
  description = "IP pública de ec2"
  value = aws_instance.my_first_terraform_ec2.public_ip
}