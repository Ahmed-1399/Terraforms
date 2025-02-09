variable "region" {
  default = "us-east-1"
}

variable "vpc_name" {
  default = "terraform-vpc"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
##################################
# IGW Name
variable "igw_name" {
  default = "terraform-igw"
}
# egress Nmae
variable "egress_name" {
  default = "terraform-egress"
}
##################################

######################[ Subnet, Route Table ]######################
# Public Subnet
variable "public_subnet_cidr" {
  default = "10.0.0.0/24"
}
variable "public_subnet_name" {
  default = "terraform-public-subnet"
}
# Public Route Table 
variable "public_route_table_name" {
  default = "terraform-public-route-table"
}


# Private Subnet
variable "private_subnet_cidr" {
  default = "10.0.1.0/24"
}
variable "private_subnet_name" {
  default = "terraform-private-subnet"
}
# private Route Table 
variable "private_route_table_name" {
  default = "terraform-private-route-table"
}


# availability_zone
variable "availability_zone" {
  default = "us-east-1a"
}

######################[ NAT, EC2 ami, Instance_Type, SGs ]######################
# NAT Gateway
variable "nat_gateway_name" {
  default = "terraform-nat-gateway-Public_Subnet"
}
# public_ec2_ami
variable "public_ec2_ami" {
  default = "ami-0c614dee691cbbf37"
}

# private_ec2_ami
variable "private_ec2_ami" {
  default = "ami-0c614dee691cbbf37"
}

# Instance Type
variable "instance_type" {
  default = "t2.micro"
}


# Security Group SGs
variable "public_EC2_SG" {
  default     = "terraform-public-SG"
  description = "Allow SSH traffic"
}
variable "private_EC2_SG" {
  default     = "terraform-private-SG"
  description = "Allow SSH traffic"
}

