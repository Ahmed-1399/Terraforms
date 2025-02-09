resource "aws_iam_user" "user_name" {
    name = var.user_name
    path = "/user/"
    tags = {
        Name = var.user_name
    }
}

resource "aws_iam_access_key" "user_access_key" {
    user = aws_iam_user.user_name.name
 }

resource "aws_iam_user_policy" "user_policy" {
    name = "s3-full-access"
    # Apply Policy on User 
    user = aws_iam_user.user_name.name
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}