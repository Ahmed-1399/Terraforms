resource "aws_s3_bucket" "bucket_namesd" {
    bucket = var.bucket_name
    tags = {
        Name = "bucket_namesd"
    }
}