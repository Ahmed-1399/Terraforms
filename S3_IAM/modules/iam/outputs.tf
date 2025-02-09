output "user_name" {
    # value = "${aws_iam_user.iam_user.name}"
    #       resource_type.resource_name
    value = aws_iam_user.user_name.name
}

output "user_arn" {
    value = aws_iam_user.user_name.arn
}

output "access_key_id" {
    value = aws_iam_access_key.user_access_key.id
}

output "secret_access_key" {
    value = aws_iam_access_key.user_access_key.secret
    description = "The secret access key. This will be written to the state file in plain-text"
    # Don't appear in terminal will written in ".tfstate file"
    # if you want to appear it write this command in terminal [terraform output secret_access_key]
    sensitive = true

}