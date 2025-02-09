# Security Group for public_EC2_SG
resource "aws_security_group" "public_EC2_SG" {
  name        = var.public_EC2_SG
  description = var.public_EC2_SG
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH"
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
    Name = "public_EC2_SG"
  }
}

# Security Group for Private subnet_EC2
resource "aws_security_group" "private_EC2_SG" {
  name        = var.private_EC2_SG
  description = var.private_EC2_SG
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH"
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
    Name = "private_EC2_SG"
  }
}