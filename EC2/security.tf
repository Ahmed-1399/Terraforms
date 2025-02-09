resource "aws_security_group" "SGs" {
  name = "SSH"
  description = "open ssh from Termainl"
  tags = {
    name = "SSH"
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    # Allows all ports for the specified protocol.
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]    
    }
}

###############################################################################
resource "tls_private_key" "my-key" {
  algorithm = "RSA"
  rsa_bits = 4096
}
resource "aws_key_pair" "my-key" {
  key_name = "my-key"
  public_key = tls_private_key.my-key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.my-key.private_key_pem}' > my-key.pem && chmod 400 my-key.pem"
    # to Download "private_key" to my pc
    interpreter = [ "PowerShell", "-Command" ]
  }
}
