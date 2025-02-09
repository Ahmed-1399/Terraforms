output "bucket_id" {
    #     module.Dir.output_name
    value = module.s3.s3_bucket_id
    description = "The ID of the bucket."  
}
output "bucket_name" {
    value = module.s3.s3_bucket_name
    description = "Name of the bucket"
}
output "bucket_region" {
  value = module.s3.s3_bucket_region
  description = "Region of the bucket"
}
output "bucket_arn" {
  value = module.s3.s3_buket_arn
  description = "ARN of the bucket"
}

########################################################################

output "user_name" {
    value = module.iam.user_name
    description = "IAM user name"
}
output "user_arn" {
  value = module.iam.user_arn
}
output "access_key_id" {
    value = module.iam.access_key_id
}
output "secret_access_key" {
  value = module.iam.secret_access_key
  sensitive = true
}