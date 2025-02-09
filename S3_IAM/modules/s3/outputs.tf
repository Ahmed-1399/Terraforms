output "s3_bucket_id" {
    value = aws_s3_bucket.bucket_namesd.id
}
output "s3_bucket_name" {
    value = aws_s3_bucket.bucket_namesd.bucket_domain_name
}
output "s3_bucket_region" {
    value = aws_s3_bucket.bucket_namesd.region
}

output "s3_buket_arn" {
    value = aws_s3_bucket.bucket_namesd.arn
}