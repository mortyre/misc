resource "aws_iam_policy" "AWSLambdaBasicExecutionRole-3f87559a-531c-4789-b832-2b77f0d84004" {
  name = "AWSLambdaBasicExecutionRole-3f87559a-531c-4789-b832-2b77f0d84004"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:us-east-1:633944440063:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:633944440063:log-group:/aws/lambda/add_tags_func:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "AWSLambdaBasicExecutionRole-860293ab-83d3-4289-8531-6d3432a27fbd" {
  name = "AWSLambdaBasicExecutionRole-860293ab-83d3-4289-8531-6d3432a27fbd"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:eu-central-1:633944440063:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:eu-central-1:633944440063:log-group:/aws/lambda/war-gamelift-newlogs-notify:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "AWSLambdaBasicExecutionRole-f4003612-3fa9-4be2-93bc-be77e983fdd7" {
  name = "AWSLambdaBasicExecutionRole-f4003612-3fa9-4be2-93bc-be77e983fdd7"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:us-east-1:633944440063:*"
    },
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:633944440063:log-group:/aws/lambda/owp-rewards-function:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "AWSLambdaMicroserviceExecutionRole-604d5eb8-6e3a-4f75-ae36-1d1c10bb0051" {
  name = "AWSLambdaMicroserviceExecutionRole-604d5eb8-6e3a-4f75-ae36-1d1c10bb0051"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "dynamodb:DeleteItem",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:Scan",
        "dynamodb:UpdateItem"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:dynamodb:us-east-1:633944440063:table/*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "AWSLambdaS3ExecutionRole-70041fc0-bda6-425e-b58f-5c4d85d79c7c" {
  name = "AWSLambdaS3ExecutionRole-70041fc0-bda6-425e-b58f-5c4d85d79c7c"
  path = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "AWSQuickSightIAMPolicy" {
  description = "Grants Amazon QuickSight list permissions to AWS IAM resources"
  name        = "AWSQuickSightIAMPolicy"
  path        = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:List*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "AWSQuickSightS3Policy" {
  description = "Grants Amazon QuickSight read permission to Amazon S3 resources"
  name        = "AWSQuickSightS3Policy"
  path        = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:ListBucket",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::dev-reports-02",
      "Sid": "VisualEditor0"
    },
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::dev-reports-02/*",
      "Sid": "VisualEditor1"
    },
    {
      "Action": "s3:ListAllMyBuckets",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::*",
      "Sid": "VisualEditor2"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "CloudhealthPolicy" {
  name = "CloudhealthPolicy"
  path = "/"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "aws-portal:ViewBilling",
                "aws-portal:ViewUsage",
                "autoscaling:Describe*",
                "cloudformation:ListStacks",
                "cloudformation:ListStackResources",
                "cloudformation:DescribeStacks",
                "cloudformation:DescribeStackEvents",
                "cloudformation:DescribeStackResources",
                "cloudformation:GetTemplate",
                "cloudfront:Get*",
                "cloudfront:List*",
                "cloudtrail:ListTags",
                "cloudwatch:Describe*",
                "cloudwatch:Get*",
                "cloudwatch:List*",
                "config:Get*",
                "config:Describe*",
                "config:Deliver*",
                "config:List*",
                "cur:Describe*",
                "cur:PutReportDefinition",
                "dynamodb:DescribeTable",
                "dynamodb:ListTables",
                "dynamodb:List*",
                "ec2:Describe*",
                "elasticache:Describe*",
                "elasticache:ListTagsForResource",
                "elasticbeanstalk:Check*",
                "elasticbeanstalk:Describe*",
                "elasticbeanstalk:List*",
                "elasticbeanstalk:RequestEnvironmentInfo",
                "elasticbeanstalk:RetrieveEnvironmentInfo",
                "elasticfilesystem:Describe*",
                "elasticloadbalancing:Describe*",
                "elasticmapreduce:Describe*",
                "elasticmapreduce:List*",
                "es:Describe*",
                "es:List*",
                "lambda:List*",
                "iam:List*",
                "iam:Get*",
                "iam:GenerateCredentialReport",
                "kinesis:Describe*",
                "redshift:Describe*",
                "route53:Get*",
                "route53:List*",
                "rds:Describe*",
                "rds:ListTagsForResource",
                "s3:List*",
                "s3:GetBucketTagging",
                "s3:GetBucketLocation",
                "s3:GetBucketLogging",
                "s3:GetBucketVersioning",
                "s3:GetBucketWebsite",
                "sdb:GetAttributes",
                "sdb:List*",
                "sdb:Select*",
                "ses:Get*",
                "ses:List*",
                "sns:Get*",
                "sns:List*",
                "sqs:GetQueueAttributes",
                "sqs:ListQueues",
                "storagegateway:List*",
                "storagegateway:Describe*",
                "ec2:CreateReservedInstancesListing",
                "ec2:DescribeReservedInstances",
                "ec2:DescribeReservedInstancesListings",
                "ec2:DescribeReservedInstancesModifications",
                "ec2:DescribeReservedInstancesOfferings",
                "ec2:ModifyReservedInstances",
                "sts:GetFederationToken",
                "ec2:CancelReservedInstancesListing",
                "ec2:CreateReservedInstancesListing",
                "ec2:PurchaseReservedInstancesOffering",
                "workspaces:Describe*"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_iam_policy" "CodeBuildTrustPolicy-war-dev-1524238932134" {
  description = "Policy used in trust relationship with CodeBuild"
  name        = "CodeBuildTrustPolicy-war-dev-1524238932134"
  path        = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "logs:CreateLogStream",
        "ssm:GetParameters",
        "logs:PutLogEvents",
        "s3:GetObjectVersion"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:ssm:us-east-1:633944440063:parameter/CodeBuild/*",
        "arn:aws:s3:::codepipeline-us-east-1-*",
        "arn:aws:logs:us-east-1:633944440063:log-group:/aws/codebuild/war-dev",
        "arn:aws:logs:us-east-1:633944440063:log-group:/aws/codebuild/war-dev:*"
      ],
      "Sid": "VisualEditor0"
    },
    {
      "Action": "ecr:*",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor1"
    },
    {
      "Action": "logs:CreateLogGroup",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:633944440063:log-group:/aws/codebuild/war-dev",
        "arn:aws:logs:us-east-1:633944440063:log-group:/aws/codebuild/war-dev:*"
      ],
      "Sid": "VisualEditor2"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "DYNAMODB-ap3" {
  name = "DYNAMODB-ap3"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "dynamodb:*",
      "Effect": "Allow",
      "Resource": "arn:aws:dynamodb:us-east-1:633944440063:table/Msk_*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "DynamoDB" {
  description = "DynamoDB"
  name        = "DynamoDB"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "dynamodb:BatchGetItem",
        "dynamodb:BatchWriteItem",
        "dynamodb:CreateTable",
        "dynamodb:DeleteItem",
        "dynamodb:DescribeTable",
        "dynamodb:GetItem",
        "dynamodb:ListTables",
        "dynamodb:PutItem",
        "dynamodb:Query",
        "dynamodb:Scan",
        "dynamodb:UpdateItem"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:dynamodb:us-east-1:633944440063:table/*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "EC2-startstop" {
  name = "EC2-startstop"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:TerminateInstances",
        "ec2:StartInstances",
        "ec2:RunInstances",
        "ec2:StopInstances"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "FluentD-Kinesis" {
  description = "Access to Kinesis streams for FluentD"
  name        = "FluentD-Kinesis"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "firehose:PutRecord",
        "firehose:PutRecordBatch"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:firehose:us-east-1:633944440063:deliverystream/kinesis-logs-*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "GAMELIFT-infra" {
  name = "GAMELIFT-infra"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "gamelift:DescribeFleetCapacity",
        "gamelift:UpdateFleetCapacity",
        "gamelift:DescribeFleetAttributes",
        "gamelift:GetInstanceAccess",
        "gamelift:DescribeInstances",
        "gamelift:ListFleets"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "GAMELIFT-policy" {
  name = "GAMELIFT-policy"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "gamelift:CreatePlayerSession",
        "gamelift:CreatePlayerSessions",
        "gamelift:ListFleets",
        "gamelift:CreateGameSession",
        "gamelift:UpdateGameSession",
        "gamelift:SearchGameSessions",
        "gamelift:ResolveAlias",
        "gamelift:ListBuilds",
        "gamelift:GetInstanceAccess",
        "gamelift:ListAliases",
        "gamelift:RequestUploadCredentials",
        "gamelift:GetGameSessionLogUrl",
        "gamelift:*Matchmaking",
        "gamelift:Describe*",
        "gamelift:StartGameSessionPlacement"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "GameLift" {
  description = "GameLift"
  name        = "GameLift"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "gamelift:CreatePlayerSession",
        "gamelift:CreatePlayerSessions",
        "gamelift:ListFleets",
        "gamelift:CreateGameSession",
        "gamelift:UpdateGameSession",
        "gamelift:SearchGameSessions",
        "gamelift:ResolveAlias",
        "gamelift:ListBuilds",
        "gamelift:GetInstanceAccess",
        "gamelift:ListAliases",
        "gamelift:RequestUploadCredentials",
        "gamelift:GetGameSessionLogUrl",
        "gamelift:*Matchmaking",
        "gamelift:Describe*",
        "gamelift:StartGameSessionPlacement"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "GameLift-GameDesigners" {
  name = "GameLift-GameDesigners"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "gamelift:UpdateRuntimeConfiguration",
        "gamelift:CreatePlayerSession",
        "gamelift:DescribeScalingPolicies",
        "gamelift:DescribeFleetUtilization",
        "gamelift:CreatePlayerSessions",
        "gamelift:CreateBuild",
        "gamelift:ListFleets",
        "gamelift:UpdateAlias",
        "gamelift:DescribeFleetCapacity",
        "gamelift:DescribeBuild",
        "gamelift:CreateGameSession",
        "gamelift:UpdateGameSession",
        "gamelift:SearchGameSessions",
        "gamelift:ResolveAlias",
        "gamelift:UpdateFleetAttributes",
        "gamelift:ListBuilds",
        "gamelift:DescribeInstances",
        "gamelift:DeleteBuild",
        "gamelift:DescribeFleetPortSettings",
        "gamelift:DescribeEC2InstanceLimits",
        "gamelift:DescribeRuntimeConfiguration",
        "gamelift:DescribePlayerSessions",
        "gamelift:DescribeFleetEvents",
        "gamelift:UpdateFleetPortSettings",
        "gamelift:GetInstanceAccess",
        "gamelift:DescribeAlias",
        "gamelift:CreateAlias",
        "gamelift:ListAliases",
        "gamelift:RequestUploadCredentials",
        "gamelift:DescribeGameSessionDetails",
        "gamelift:GetGameSessionLogUrl",
        "gamelift:DescribeFleetAttributes",
        "gamelift:DeleteAlias",
        "gamelift:UpdateBuild",
        "gamelift:DescribeGameSessions",
        "gamelift:CreateMatchmakingConfiguration",
        "gamelift:DescribeMatchmakingConfigurations",
        "gamelift:UpdateMatchmakingConfiguration",
        "gamelift:CreateMatchmakingRuleSet",
        "gamelift:DescribeMatchmakingRuleSets",
        "gamelift:ValidateMatchmakingRuleSet",
        "gamelift:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "GameLift-Matchmaking" {
  name = "GameLift-Matchmaking"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "gamelift:*Matchmaking"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "GameLiftAdmin" {
  name = "GameLiftAdmin"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "gamelift:*",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "GameLiftPlayer" {
  name = "GameLiftPlayer"
  path = "/"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": {
        "Effect": "Allow",
        "Action": [
            "gamelift:CreateGameSession",
            "gamelift:DescribeGameSessions",
            "gamelift:SearchGameSessions",
            "gamelift:CreatePlayerSession"
        ],
        "Resource": "*"
    }
}
POLICY
}

resource "aws_iam_policy" "GameLiftRO" {
  description = "GameLift Read Only + List"
  name        = "GameLiftRO"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "gamelift:DescribeFleetPortSettings",
        "gamelift:DescribeEC2InstanceLimits",
        "gamelift:DescribeRuntimeConfiguration",
        "gamelift:DescribePlayerSessions",
        "gamelift:DescribeFleetEvents",
        "gamelift:DescribeScalingPolicies",
        "gamelift:DescribeFleetUtilization",
        "gamelift:GetInstanceAccess",
        "gamelift:DescribeAlias",
        "gamelift:ListFleets",
        "gamelift:ListAliases",
        "gamelift:DescribeFleetCapacity",
        "gamelift:DescribeBuild",
        "gamelift:RequestUploadCredentials",
        "gamelift:DescribeGameSessionDetails",
        "gamelift:SearchGameSessions",
        "gamelift:ResolveAlias",
        "gamelift:GetGameSessionLogUrl",
        "gamelift:DescribeFleetAttributes",
        "gamelift:ListBuilds",
        "gamelift:DescribeInstances",
        "gamelift:DescribeGameSessions"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "IAM-PASS-ROLE" {
  description = "Used for rundeck ec2 instances creation"
  name        = "IAM-PASS-ROLE"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "iam:PassRole",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "KinesisLogs-infra" {
  description = "Access to Kinesis streams for FluentD"
  name        = "KinesisLogs-infra"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::whalekit-kinesis-logs-dev-infra",
        "arn:aws:s3:::whalekit-kinesis-logs-dev-infra/*"
      ],
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "QuickSightSignUpPolicy" {
  name = "QuickSightSignUpPolicy"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "iam:CreatePolicy",
        "ds:CreateIdentityPoolDirectory",
        "ds:DescribeTrusts",
        "ds:UnauthorizeApplication",
        "iam:ListAccountAliases",
        "iam:CreateRole",
        "ds:DescribeDirectories",
        "ds:CreateAlias",
        "ds:AuthorizeApplication",
        "ds:CheckAlias",
        "ds:DeleteDirectory"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    },
    {
      "Action": [
        "quicksight:CreateUser",
        "quicksight:CreateAdmin",
        "quicksight:Subscribe"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "REPORTS-all" {
  name = "REPORTS-all"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets",
        "dynamodb:DescribeTable",
        "dynamodb:ListTables",
        "dynamodb:ListTagsOfResource",
        "elasticache:DescribeCacheClusters",
        "elasticache:ListTagsForResource"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "ROUTE53-ddns-update" {
  name = "ROUTE53-ddns-update"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "route53:ChangeResourceRecordSets",
        "route53:ListResourceRecordSets"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:route53:::hostedzone/Z3FBMLYC0KZCKB",
        "arn:aws:route53:::hostedzone/ZJGXOARRVXPES",
        "arn:aws:route53:::hostedzone/ZOU8R87V46C3S"
      ],
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "ReadOnlyBilling" {
  description = "Same as Billing but restricts access to account settings"
  name        = "ReadOnlyBilling"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "aws-portal:*Billing",
        "aws-portal:*Usage",
        "awsbillingconsole:*Usage",
        "budgets:ViewBudget",
        "cur:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "S3-gat" {
  name = "S3-gat"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::gat-player-state-dev",
        "arn:aws:s3:::gat-player-state-dev/*"
      ],
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "S3-gat-player-state-dev" {
  description = "S3-gat-player-state-dev"
  name        = "S3-gat-player-state-dev"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::gat-player-state-dev",
        "arn:aws:s3:::gat-player-state-dev/*"
      ],
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "S3-war-dev" {
  description = "S3-war-dev read only"
  name        = "S3-war-dev"
  path        = "/"

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
}

resource "aws_iam_policy" "S3-whalekit-yes-dev-replays" {
  description = "S3-whalekit-yes-dev-replays"
  name        = "S3-whalekit-yes-dev-replays"
  path        = "/"

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
        "arn:aws:s3:::whalekit-yes-dev-replays",
        "arn:aws:s3:::whalekit-yes-dev-replays/*"
      ],
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "SNS" {
  description = "SNS"
  name        = "SNS"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sns:CreateTopic",
        "sns:ListSubscriptionsByTopic",
        "sns:ListTopics",
        "sns:Publish",
        "sns:SetTopicAttributes",
        "sns:Subscribe"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:sns:us-east-1:633944440063:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "SQS" {
  description = "SQS"
  name        = "SQS"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sqs:CreateQueue",
        "sqs:DeleteMessage",
        "sqs:DeleteMessageBatch",
        "sqs:DeleteQueue",
        "sqs:GetQueueAttributes",
        "sqs:GetQueueUrl",
        "sqs:ListQueues",
        "sqs:ReceiveMessage",
        "sqs:SendMessage",
        "sqs:SetQueueAttributes"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:sqs:us-east-1:633944440063:*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "TAGGING-infra" {
  name = "TAGGING-infra"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "ec2:CreateTags",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "Tags" {
  description = "Tags"
  name        = "Tags"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:CreateTags",
        "ec2:DescribeTags"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "WAR-Admin-Cloudwatch" {
  description = "Access to Cloudwatch for admin for Warface"
  name        = "WAR-Admin-Cloudwatch"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "cloudwatch:DescribeAlarmHistory",
        "cloudwatch:GetDashboard",
        "cloudwatch:GetMetricData",
        "cloudwatch:DescribeAlarmsForMetric",
        "cloudwatch:ListDashboards",
        "cloudwatch:DescribeAlarms",
        "cloudwatch:GetMetricStatistics",
        "cloudwatch:GetMetricWidgetImage",
        "cloudwatch:ListMetrics"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "WAR-Admin-Gamelift" {
  description = "Access to Cloudwatch for admin for Warface"
  name        = "WAR-Admin-Gamelift"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "gamelift:Describe*",
        "gamelift:GetInstanceAccess",
        "gamelift:ListFleets",
        "gamelift:ListAliases",
        "gamelift:SearchGameSessions",
        "gamelift:ResolveAlias",
        "gamelift:GetGameSessionLogUrl",
        "gamelift:ListBuilds"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "ebs-gat-dev-rw" {
  description = "this policy 4 artem can update gat-dev ebs version"
  name        = "ebs-gat-dev-rw"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "elasticbeanstalk:ComposeEnvironments",
        "elasticbeanstalk:AbortEnvironmentUpdate",
        "elasticbeanstalk:TerminateEnvironment",
        "elasticbeanstalk:DescribeEnvironmentManagedActionHistory",
        "elasticbeanstalk:CreateApplicationVersion",
        "elasticbeanstalk:ValidateConfigurationSettings",
        "elasticbeanstalk:DescribeEnvironmentResources",
        "elasticbeanstalk:RequestEnvironmentInfo",
        "elasticbeanstalk:RebuildEnvironment",
        "elasticbeanstalk:UpdateApplicationVersion",
        "elasticbeanstalk:DescribeInstancesHealth",
        "elasticbeanstalk:DescribeEnvironmentHealth",
        "elasticbeanstalk:DeleteApplication",
        "elasticbeanstalk:DeleteConfigurationTemplate",
        "elasticbeanstalk:RestartAppServer",
        "elasticbeanstalk:DeleteApplicationVersion",
        "elasticbeanstalk:DescribeConfigurationSettings",
        "elasticbeanstalk:CreateConfigurationTemplate",
        "elasticbeanstalk:UpdateConfigurationTemplate",
        "elasticbeanstalk:CreateApplication",
        "elasticbeanstalk:UpdateApplication",
        "elasticbeanstalk:DescribeEnvironmentManagedActions",
        "elasticbeanstalk:SwapEnvironmentCNAMEs",
        "elasticbeanstalk:DescribeConfigurationOptions",
        "elasticbeanstalk:ApplyEnvironmentManagedAction",
        "elasticbeanstalk:DescribeEvents",
        "elasticbeanstalk:CreateEnvironment",
        "elasticbeanstalk:DeleteEnvironmentConfiguration",
        "elasticbeanstalk:UpdateEnvironment",
        "elasticbeanstalk:RetrieveEnvironmentInfo",
        "elasticbeanstalk:Describe*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:elasticbeanstalk:::configurationtemplate/generic-admin-tool/",
        "arn:aws:elasticbeanstalk:*:*:application/generic-admin-tool",
        "arn:aws:elasticbeanstalk:::environment/generic-admin-tool/",
        "arn:aws:elasticbeanstalk:::applicationversion/generic-admin-tool/"
      ],
      "Sid": "VisualEditor0"
    },
    {
      "Action": [
        "elasticbeanstalk:CreatePlatformVersion",
        "elasticbeanstalk:DescribePlatformVersion",
        "elasticbeanstalk:DeletePlatformVersion",
        "elasticbeanstalk:UpdateApplicationResourceLifecycle",
        "elasticbeanstalk:CreateStorageLocation",
        "elasticbeanstalk:CheckDNSAvailability"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "ingressController-iam-policy" {
  description = "ingressController-iam-policy"
  name        = "ingressController-iam-policy"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "acm:DescribeCertificate",
        "acm:ListCertificates",
        "acm:GetCertificate"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:CreateSecurityGroup",
        "ec2:CreateTags",
        "ec2:DeleteTags",
        "ec2:DeleteSecurityGroup",
        "ec2:DescribeAccountAttributes",
        "ec2:DescribeAddresses",
        "ec2:DescribeInstances",
        "ec2:DescribeInstanceStatus",
        "ec2:DescribeInternetGateways",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSubnets",
        "ec2:DescribeTags",
        "ec2:DescribeVpcs",
        "ec2:ModifyInstanceAttribute",
        "ec2:ModifyNetworkInterfaceAttribute",
        "ec2:RevokeSecurityGroupIngress"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "elasticloadbalancing:AddListenerCertificates",
        "elasticloadbalancing:AddTags",
        "elasticloadbalancing:CreateListener",
        "elasticloadbalancing:CreateLoadBalancer",
        "elasticloadbalancing:CreateRule",
        "elasticloadbalancing:CreateTargetGroup",
        "elasticloadbalancing:DeleteListener",
        "elasticloadbalancing:DeleteLoadBalancer",
        "elasticloadbalancing:DeleteRule",
        "elasticloadbalancing:DeleteTargetGroup",
        "elasticloadbalancing:DeregisterTargets",
        "elasticloadbalancing:DescribeListenerCertificates",
        "elasticloadbalancing:DescribeListeners",
        "elasticloadbalancing:DescribeLoadBalancers",
        "elasticloadbalancing:DescribeLoadBalancerAttributes",
        "elasticloadbalancing:DescribeRules",
        "elasticloadbalancing:DescribeSSLPolicies",
        "elasticloadbalancing:DescribeTags",
        "elasticloadbalancing:DescribeTargetGroups",
        "elasticloadbalancing:DescribeTargetGroupAttributes",
        "elasticloadbalancing:DescribeTargetHealth",
        "elasticloadbalancing:ModifyListener",
        "elasticloadbalancing:ModifyLoadBalancerAttributes",
        "elasticloadbalancing:ModifyRule",
        "elasticloadbalancing:ModifyTargetGroup",
        "elasticloadbalancing:ModifyTargetGroupAttributes",
        "elasticloadbalancing:RegisterTargets",
        "elasticloadbalancing:RemoveListenerCertificates",
        "elasticloadbalancing:RemoveTags",
        "elasticloadbalancing:SetIpAddressType",
        "elasticloadbalancing:SetSecurityGroups",
        "elasticloadbalancing:SetSubnets",
        "elasticloadbalancing:SetWebACL"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "iam:CreateServiceLinkedRole",
        "iam:GetServerCertificate",
        "iam:ListServerCertificates"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "waf-regional:GetWebACLForResource",
        "waf-regional:GetWebACL",
        "waf-regional:AssociateWebACL",
        "waf-regional:DisassociateWebACL"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "tag:GetResources",
        "tag:TagResources"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "waf:GetWebACL"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "kinesis-dev" {
  name = "kinesis-dev"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "firehose:PutRecord",
        "firehose:PutRecordBatch"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:firehose:us-east-1:633944440063:deliverystream/infra-dev",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "quicksightpolicy2" {
  name = "quicksightpolicy2"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ds:AuthorizeApplication",
        "ds:UnauthorizeApplication",
        "ds:CheckAlias",
        "ds:CreateAlias",
        "ds:DescribeDirectories",
        "ds:DescribeTrusts",
        "ds:DeleteDirectory",
        "ds:CreateIdentityPoolDirectory",
        "iam:CreatePolicy",
        "iam:CreateRole",
        "iam:ListAccountAliases",
        "quicksight:CreateUser",
        "quicksight:Subscribe"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "iam:AttachRolePolicy",
        "iam:DetachRolePolicy",
        "iam:ListAttachedRolePolicies",
        "iam:CreatePolicy",
        "iam:GetPolicy",
        "iam:CreatePolicyVersion",
        "iam:DeletePolicyVersion",
        "iam:GetPolicyVersion",
        "iam:ListPolicyVersions",
        "iam:CreateRole",
        "iam:DeleteRole",
        "iam:GetRole",
        "iam:ListRoles",
        "iam:ListEntitiesForPolicy",
        "s3:ListAllMyBuckets"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": "quicksight:Unsubscribe",
      "Effect": "Deny",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "s3-gamelift" {
  description = "Access to S3 for GameLift"
  name        = "s3-gamelift"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetObjectMetadata"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::whalekit-war-gamelift-*/*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "s3_access_to_prod_4_qs" {
  name = "s3_access_to_prod_4_qs"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:ListAllMyBuckets",
        "s3:HeadBucket"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    },
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::prod-reports-02",
        "arn:aws:s3:::prod-reports-02/*"
      ],
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "s3_dev-reports-02_add_and_del" {
  description = "policy for syncing reports from prod account, edit manifests and delete old files"
  name        = "s3_dev-reports-02_add_and_del"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:ListBucket",
        "s3:DeleteObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::dev-reports-02",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "s3access4stardustdeploy" {
  description = "the policy for deploy stardust from s3 deploy-stardust bucket to windows machines"
  name        = "s3access4stardustdeploy"
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:PutAnalyticsConfiguration",
        "s3:GetObjectVersionTagging",
        "s3:CreateBucket",
        "s3:ReplicateObject",
        "s3:GetObjectAcl",
        "s3:DeleteBucketWebsite",
        "s3:PutLifecycleConfiguration",
        "s3:GetObjectVersionAcl",
        "s3:PutObjectTagging",
        "s3:DeleteObject",
        "s3:GetIpConfiguration",
        "s3:DeleteObjectTagging",
        "s3:GetBucketWebsite",
        "s3:PutReplicationConfiguration",
        "s3:DeleteObjectVersionTagging",
        "s3:GetBucketNotification",
        "s3:PutBucketCORS",
        "s3:GetReplicationConfiguration",
        "s3:ListMultipartUploadParts",
        "s3:PutObject",
        "s3:GetObject",
        "s3:PutBucketNotification",
        "s3:PutBucketLogging",
        "s3:GetAnalyticsConfiguration",
        "s3:GetObjectVersionForReplication",
        "s3:GetLifecycleConfiguration",
        "s3:ListBucketByTags",
        "s3:GetInventoryConfiguration",
        "s3:GetBucketTagging",
        "s3:PutAccelerateConfiguration",
        "s3:DeleteObjectVersion",
        "s3:GetBucketLogging",
        "s3:ListBucketVersions",
        "s3:ReplicateTags",
        "s3:RestoreObject",
        "s3:ListBucket",
        "s3:GetAccelerateConfiguration",
        "s3:GetBucketPolicy",
        "s3:PutEncryptionConfiguration",
        "s3:GetEncryptionConfiguration",
        "s3:GetObjectVersionTorrent",
        "s3:AbortMultipartUpload",
        "s3:PutBucketTagging",
        "s3:GetBucketRequestPayment",
        "s3:GetObjectTagging",
        "s3:GetMetricsConfiguration",
        "s3:DeleteBucket",
        "s3:PutBucketVersioning",
        "s3:ListBucketMultipartUploads",
        "s3:PutMetricsConfiguration",
        "s3:PutObjectVersionTagging",
        "s3:GetBucketVersioning",
        "s3:GetBucketAcl",
        "s3:PutInventoryConfiguration",
        "s3:PutIpConfiguration",
        "s3:GetObjectTorrent",
        "s3:PutBucketWebsite",
        "s3:PutBucketRequestPayment",
        "s3:GetBucketCORS",
        "s3:GetBucketLocation",
        "s3:ReplicateDelete",
        "s3:GetObjectVersion"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::dev-photon-1/*",
        "arn:aws:s3:::dev-photon-1"
      ],
      "Sid": "VisualEditor0"
    },
    {
      "Action": [
        "s3:ListAllMyBuckets",
        "s3:HeadBucket"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "start-pipeline-execution-war-dev" {
  description = "Allows Amazon CloudWatch Events to automatically start a new execution in the war-dev pipeline when a change occurs"
  name        = "start-pipeline-execution-war-dev"
  path        = "/service-role/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "codepipeline:StartPipelineExecution"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:codepipeline:us-east-1:633944440063:war-dev"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "yes-dev-aio-access-2-s3-bucket" {
  description = "temporary reshenie"
  name        = "yes-dev-aio-access-2-s3-bucket"
  path        = "/"

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
        "arn:aws:s3:::whalekit-yes-dev-replays",
        "arn:aws:s3:::whalekit-yes-dev-replays/*"
      ],
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}
