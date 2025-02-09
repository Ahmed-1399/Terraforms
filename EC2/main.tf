resource "aws_instance" "create_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = var.instance_name
    }

    key_name = var.key-name

    security_groups = [aws_security_group.SGs.name]
}
