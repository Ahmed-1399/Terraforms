variable "region" {
  type = string
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-05576a079321f21f8"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "instance_name" {
  type = string
  default = "testing"
}

variable "key-name" {
  type = string
  default = "my-key"
}