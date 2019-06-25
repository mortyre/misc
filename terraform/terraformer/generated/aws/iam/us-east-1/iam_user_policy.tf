resource "aws_iam_user_policy" "nperevozchikov_EKS-FullAccess" {
  name = "EKS-FullAccess"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "eks:*",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "nperevozchikov"
}

resource "aws_iam_user_policy" "rgonta_IAM-change-password" {
  name = "IAM-change-password"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "iam:ChangePassword",
      "Effect": "Allow",
      "Resource": "arn:aws:iam::*:user/rgonta",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "rgonta"
}

resource "aws_iam_user_policy" "rgonta_S3-war-dev" {
  name = "S3-war-dev"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets",
        "s3:HeadBucket",
        "s3:ListObjects"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    },
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::*/*",
        "arn:aws:s3:::war-dev"
      ],
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "rgonta"
}

resource "aws_iam_user_policy" "route53-manager_Route53-whalekit--ru" {
  name = "Route53-whalekit.ru"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "route53:ListTagsForResources",
        "route53:GetChange",
        "route53:GetHostedZone",
        "route53:ChangeResourceRecordSets",
        "route53:ChangeTagsForResource",
        "route53:ListResourceRecordSets",
        "route53:GetHostedZoneLimit",
        "route53:ListTagsForResource"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:route53:::change/Z3OK0O4UHN96A0",
        "arn:aws:route53:::hostedzone/Z3OK0O4UHN96A0"
      ],
      "Sid": "VisualEditor0"
    },
    {
      "Action": [
        "route53:ListHostedZones",
        "route53:TestDNSAnswer"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "route53-manager"
}

resource "aws_iam_user_policy" "teamcity_S3-war-dev" {
  name = "S3-war-dev"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets",
        "s3:HeadBucket",
        "s3:ListObjects"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    },
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::war-dev/*",
        "arn:aws:s3:::war-dev"
      ],
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "teamcity"
}

resource "aws_iam_user_policy" "teamcity_yes-dev-teamcity" {
  name = "yes-dev-teamcity"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::whalekit-yes-dev",
        "arn:aws:s3:::whalekit-yes-dev/*",
        "arn:aws:s3:::whalekit-yes-prod/*",
        "arn:aws:s3:::whalekit-yes-prod"
      ],
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "teamcity"
}

resource "aws_iam_user_policy" "whalekit-svn-dev_whalekit-svn-dev" {
  name = "whalekit-svn-dev"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets",
        "cloudfront:GetInvalidation",
        "s3:HeadBucket",
        "cloudfront:CreateInvalidation",
        "s3:ListObjects"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    },
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::whalekit-svn-dev",
        "arn:aws:s3:::whalekit-svn-dev/*"
      ],
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "whalekit-svn-dev"
}

resource "aws_iam_user_policy" "zbs-remoteconsole_EC2-DescribeInstancesDescribeTags" {
  name = "EC2-DescribeInstancesDescribeTags"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:DescribeInstances",
        "ec2:DescribeTags"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = "zbs-remoteconsole"
}
