resource "aws_iam_role_policy" "file_publishing_role_policy" {
  name   = "FilePublishingRolePolicy"
  role   = aws_iam_role.file_publishing_role.name
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject*",
        "s3:GetBucket*",
        "s3:GetEncryptionConfiguration",
        "s3:List*",
        "s3:DeleteObject*",
        "s3:PutObject*",
        "s3:Abort*"
      ],
      "Resource": [
        "arn:aws:s3:::cdk-hnb659fds-assets-315627165260-us-east-1",
        "arn:aws:s3:::cdk-hnb659fds-assets-315627165260-us-east-1/*"
      ],
      "Effect": "Allow"
    },
    {
      "Action": [
        "kms:Decrypt",
        "kms:DescribeKey",
        "kms:Encrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*"
      ],
      "Resource": "arn:aws:kms:us-east-1:315627165260:key/AWS_MANAGED_KEY",
      "Effect": "Allow"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "image_publishing_role_policy" {
  name   = "ImagePublishingRolePolicy"
  role   = aws_iam_role.image_publishing_role.name
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ecr:PutImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:BatchCheckLayerAvailability",
        "ecr:DescribeRepositories",
        "ecr:DescribeImages",
        "ecr:BatchGetImage",
        "ecr:GetDownloadUrlForLayer"
      ],
      "Resource": "arn:aws:ecr:us-east-1:315627165260:repository/cdk-hnb659fds-container-assets-315627165260-us-east-1",
      "Effect": "Allow"
    },
    {
      "Action": [
        "ecr:GetAuthorizationToken"
      ],
      "Resource": "*",
      "Effect": "Allow"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "lookup_role_policy" {
  name   = "LookupRolePolicy"
  role   = aws_iam_role.lookup_role.name
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "kms:Decrypt"
      ],
      "Resource": "*",
      "Effect": "Deny",
      "Sid": "DontReadSecrets"
    }
  ]
}
POLICY
}