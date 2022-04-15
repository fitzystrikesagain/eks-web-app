module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "fitzy-deploy-webapp-eks"
  acl    = "private"

  versioning = {
    enabled = true
  }
}

resource "aws_s3_bucket_policy" "deploy_webapp_bucket_policy" {
  bucket = module.s3_bucket.s3_bucket_id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "AccessControl",
    "Statement": [
        {
            "Sid": "AllowSSLRequestsOnly",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "${module.s3_bucket.s3_bucket_arn}",
                "${module.s3_bucket.s3_bucket_arn}/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        }
    ]
}
POLICY
}
