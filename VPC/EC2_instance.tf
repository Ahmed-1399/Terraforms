# Private EC2 Instanc
resource "aws_instance" "Private_EC2_instance" {
  ami           = var.private_ec2_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  # Not Assign "Public IP Address" for "Private Instance"
  associate_public_ip_address = false
  tags = {
    Name = "Private_EC2_instance"
  }
  vpc_security_group_ids = [aws_security_group.private_EC2_SG.id]
  key_name               = "private_key"

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    EOF
}


# Public EC2 Instance
resource "aws_instance" "public_EC2_instance" {
  ami                         = var.public_ec2_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "public_EC2_instance"
  }
  vpc_security_group_ids = [aws_security_group.public_EC2_SG.id]
  key_name               = "private_key"
}

######################[ Private Key ]######################
# EC2_Keypair
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "private_key" {
  key_name   = "private_key"
  public_key = tls_private_key.private_key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.private_key.private_key_pem}' > private_key.pem"
    # to Download "private_key" to my pc
    interpreter = ["PowerShell", "-Command"]
  }
}
