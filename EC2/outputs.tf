output "ARN" {
  value = aws_instance.create_instance.arn
}
output "public_ip" {
  value = aws_instance.create_instance.public_ip
}