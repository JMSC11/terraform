resource "aws_s3_bucket" "proveedores" {
  count=3
  bucket = "my-jmsc-bucket-tf-${random_string.sufijos[count.index].id}"

  tags = {
    Name        = "My tf bucket"
    Environment = "Dev"
  }
}


resource "random_string" "sufijos"{
    count=3
    length = 4
    special = false
    upper = false
    numeric = false
}