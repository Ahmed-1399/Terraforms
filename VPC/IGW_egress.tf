# Internet Gateway IGW
 resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.igw_name
  }
}
# resource "aws_internet_gateway_attachment" "gateway_attachment" {
#   internet_gateway_id = aws_internet_gateway.IGW.id
#   vpc_id              = aws_vpc.vpc.id  
# }

# Egress Only Internet Gateway EG
 resource "aws_egress_only_internet_gateway" "egress" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.egress_name
 }
 }
 



# # Egress Only Internet Gateway
# resource "aws_egress_only_internet_gateway" "egress" {
#   vpc_id = aws_vpc.vpc.id
#   tags = {
#     Name = var.egress_name
#   }
# }