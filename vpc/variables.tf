variable "mex_cidr" {
    description = "CIDR Mex"
    type = string
    sensitive = false
}

# variable "public_subnet" {
#   description = "CIDR public subnet"
#   type = string
# }

# variable "private_subnet" {
#     description = "CIDR private subnet"
#     type = string
# }

variable "subnets"{
    description = "CIDR Subnets"
    type = list(string)
}

variable "tags"{
    description = "Tags"
    type = map(string)
}