resource "aws_iam_role_policy" "AWS-CodePipeline-Service_oneClick_AWS-CodePipeline-Service_1524238658996" {
  name = "oneClick_AWS-CodePipeline-Service_1524238658996"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::codepipeline*",
        "arn:aws:s3:::elasticbeanstalk*"
      ]
    },
    {
      "Action": [
        "codecommit:CancelUploadArchive",
        "codecommit:GetBranch",
        "codecommit:GetCommit",
        "codecommit:GetUploadArchiveStatus",
        "codecommit:UploadArchive"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "codedeploy:CreateDeployment",
        "codedeploy:GetApplicationRevision",
        "codedeploy:GetDeployment",
        "codedeploy:GetDeploymentConfig",
        "codedeploy:RegisterApplicationRevision"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "elasticbeanstalk:*",
        "ec2:*",
        "elasticloadbalancing:*",
        "autoscaling:*",
        "cloudwatch:*",
        "s3:*",
        "sns:*",
        "cloudformation:*",
        "rds:*",
        "sqs:*",
        "ecs:*",
        "iam:PassRole"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "lambda:InvokeFunction",
        "lambda:ListFunctions"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "opsworks:CreateDeployment",
        "opsworks:DescribeApps",
        "opsworks:DescribeCommands",
        "opsworks:DescribeDeployments",
        "opsworks:DescribeInstances",
        "opsworks:DescribeStacks",
        "opsworks:UpdateApp",
        "opsworks:UpdateStack"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "cloudformation:CreateStack",
        "cloudformation:DeleteStack",
        "cloudformation:DescribeStacks",
        "cloudformation:UpdateStack",
        "cloudformation:CreateChangeSet",
        "cloudformation:DeleteChangeSet",
        "cloudformation:DescribeChangeSet",
        "cloudformation:ExecuteChangeSet",
        "cloudformation:SetStackPolicy",
        "cloudformation:ValidateTemplate",
        "iam:PassRole"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "AWS-CodePipeline-Service"
}

resource "aws_iam_role_policy" "ec2-fluentd_to_s3_test_bucket-starkov" {
  name = "to_s3_test_bucket-starkov"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:PutAccountPublicAccessBlock",
        "s3:GetAccountPublicAccessBlock",
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
        "arn:aws:s3:::whalekit-kinesis-logs-dev-infra-fluent/*",
        "arn:aws:s3:::whalekit-kinesis-logs-dev-infra-fluent"
      ],
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "ec2-fluentd"
}

resource "aws_iam_role_policy" "ec2-infra_IAM-PassRole" {
  name = "IAM-PassRole"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "iam:PassRole",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:iam::633944440063:role/ec2_readonly",
        "arn:aws:iam::633944440063:role/gluon-asu",
        "arn:aws:iam::633944440063:role/locust-loadtest"
      ],
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "ec2-infra"
}

resource "aws_iam_role_policy" "ec2-infra_Scale-Beanstalk-enviroments" {
  name = "Scale-Beanstalk-enviroments"

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
        "s3:PutBucketAcl",
        "s3:PutObjectTagging",
        "s3:DeleteObject",
        "s3:DeleteObjectTagging",
        "s3:GetBucketPolicyStatus",
        "s3:GetBucketWebsite",
        "s3:PutReplicationConfiguration",
        "s3:DeleteObjectVersionTagging",
        "s3:GetBucketNotification",
        "s3:PutBucketCORS",
        "s3:DeleteBucketPolicy",
        "s3:GetReplicationConfiguration",
        "s3:ListMultipartUploadParts",
        "s3:PutObject",
        "s3:GetObject",
        "s3:PutBucketNotification",
        "s3:PutBucketLogging",
        "s3:PutObjectVersionAcl",
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
        "s3:PutObjectAcl",
        "s3:GetBucketPublicAccessBlock",
        "s3:ListBucketMultipartUploads",
        "s3:PutBucketPublicAccessBlock",
        "s3:PutMetricsConfiguration",
        "s3:PutObjectVersionTagging",
        "s3:GetBucketVersioning",
        "s3:GetBucketAcl",
        "s3:PutInventoryConfiguration",
        "s3:GetObjectTorrent",
        "s3:ObjectOwnerOverrideToBucketOwner",
        "s3:PutBucketWebsite",
        "s3:PutBucketRequestPayment",
        "s3:GetBucketCORS",
        "s3:PutBucketPolicy",
        "s3:GetBucketLocation",
        "s3:ReplicateDelete",
        "s3:GetObjectVersion"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::elasticbeanstalk-us-east-1-633944440063/*",
        "arn:aws:s3:::elasticbeanstalk-us-east-1-633944440063"
      ],
      "Sid": "VisualEditor0"
    },
    {
      "Action": [
        "cloudformation:ListExports",
        "logs:GetLogRecord",
        "elasticbeanstalk:DescribeAccountAttributes",
        "logs:DescribeSubscriptionFilters",
        "cloudformation:ListStackInstances",
        "logs:StartQuery",
        "elasticbeanstalk:AddTags",
        "elasticbeanstalk:DescribeEnvironmentManagedActionHistory",
        "logs:DescribeMetricFilters",
        "cloudformation:DescribeStackResource",
        "logs:ListLogDeliveries",
        "elasticbeanstalk:DescribeEnvironmentResources",
        "cloudformation:ListStackSetOperationResults",
        "cloudformation:DescribeStackEvents",
        "elasticbeanstalk:DescribeEnvironments",
        "elasticbeanstalk:DescribeApplicationVersions",
        "logs:GetLogEvents",
        "cloudformation:UpdateStack",
        "logs:FilterLogEvents",
        "s3:HeadBucket",
        "cloudformation:DescribeChangeSet",
        "logs:DescribeDestinations",
        "cloudformation:ListStackResources",
        "elasticbeanstalk:DescribePlatformVersion",
        "s3:PutAccountPublicAccessBlock",
        "cloudformation:DescribeStackInstance",
        "elasticbeanstalk:RemoveTags",
        "cloudformation:DescribeStackResources",
        "logs:StopQuery",
        "elasticbeanstalk:ListPlatformVersions",
        "cloudformation:DescribeStacks",
        "elasticbeanstalk:DescribeEnvironmentManagedActions",
        "logs:DescribeExportTasks",
        "cloudformation:DescribeStackResourceDrifts",
        "cloudformation:GetStackPolicy",
        "logs:GetQueryResults",
        "elasticbeanstalk:DescribeEvents",
        "cloudformation:GetTemplate",
        "elasticbeanstalk:UpdateEnvironment",
        "logs:ListTagsLogGroup",
        "cloudformation:DescribeStackDriftDetectionStatus",
        "cloudformation:DetectStackDrift",
        "cloudformation:ListStackSetOperations",
        "logs:DescribeLogStreams",
        "elasticbeanstalk:ValidateConfigurationSettings",
        "elasticbeanstalk:CheckDNSAvailability",
        "logs:GetLogDelivery",
        "elasticbeanstalk:ListTagsForResource",
        "cloudformation:DetectStackResourceDrift",
        "cloudformation:EstimateTemplateCost",
        "elasticbeanstalk:RequestEnvironmentInfo",
        "cloudformation:DescribeStackSetOperation",
        "elasticbeanstalk:DescribeInstancesHealth",
        "elasticbeanstalk:DescribeEnvironmentHealth",
        "elasticbeanstalk:DescribeApplications",
        "cloudformation:DescribeAccountLimits",
        "logs:DescribeResourcePolicies",
        "logs:DescribeQueries",
        "cloudformation:ListStacks",
        "logs:DescribeLogGroups",
        "cloudformation:ListImports",
        "logs:TestMetricFilter",
        "elasticbeanstalk:DescribeConfigurationSettings",
        "elasticbeanstalk:ListAvailableSolutionStacks",
        "cloudformation:GetTemplateSummary",
        "s3:GetAccountPublicAccessBlock",
        "s3:ListAllMyBuckets",
        "cloudformation:DescribeStackSet",
        "cloudformation:ListStackSets",
        "elasticbeanstalk:DescribeConfigurationOptions",
        "logs:PutRetentionPolicy",
        "logs:GetLogGroupFields",
        "elasticbeanstalk:RetrieveEnvironmentInfo",
        "cloudformation:ListChangeSets"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "ec2-infra"
}

resource "aws_iam_role_policy" "ec2-infra_TERRAFORM-STATE-DEV-S3-FULLACCESS" {
  name = "TERRAFORM-STATE-DEV-S3-FULLACCESS"

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
        "arn:aws:s3:::whalekit-dev-terraform-state/*",
        "arn:aws:s3:::whalekit-dev-terraform-state"
      ],
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "ec2-infra"
}

resource "aws_iam_role_policy" "ec2-infra_ecs_scale" {
  name = "ecs_scale"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ecs:ListAttributes",
        "ecs:DescribeTaskDefinition",
        "ecs:DescribeClusters",
        "ecs:ListServices",
        "ecs:ListAccountSettings",
        "ecs:UpdateService",
        "ecs:ListTagsForResource",
        "ecs:ListTasks",
        "ecs:ListTaskDefinitionFamilies",
        "ecs:DescribeServices",
        "ecs:ListContainerInstances",
        "ecs:DescribeContainerInstances",
        "ecs:DescribeTasks",
        "ecs:ListTaskDefinitions",
        "ecs:ListClusters"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "ec2-infra"
}

resource "aws_iam_role_policy" "gluon-asu_DynamoDB" {
  name = "DynamoDB"

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
  ]
}
POLICY

  role = "gluon-asu"
}

resource "aws_iam_role_policy" "gluon-asu_SNS" {
  name = "SNS"

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
  ]
}
POLICY

  role = "gluon-asu"
}

resource "aws_iam_role_policy" "gluon-asu_SQS" {
  name = "SQS"

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
  ]
}
POLICY

  role = "gluon-asu"
}

resource "aws_iam_role_policy" "gluon-asu_Tags" {
  name = "Tags"

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
  ]
}
POLICY

  role = "gluon-asu"
}

resource "aws_iam_role_policy" "gluon-yes-asu_DynamoDB" {
  name = "DynamoDB"

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

  role = "gluon-yes-asu"
}

resource "aws_iam_role_policy" "gluon-yes-asu_S3-gat-player-state-dev" {
  name = "S3-gat-player-state-dev"

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

  role = "gluon-yes-asu"
}

resource "aws_iam_role_policy" "gluon-yes-asu_S3-whalekit-yes-dev-replays" {
  name = "S3-whalekit-yes-dev-replays"

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

  role = "gluon-yes-asu"
}

resource "aws_iam_role_policy" "gluon-yes-asu_SNS" {
  name = "SNS"

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

  role = "gluon-yes-asu"
}

resource "aws_iam_role_policy" "gluon-yes-asu_SQS" {
  name = "SQS"

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

  role = "gluon-yes-asu"
}

resource "aws_iam_role_policy" "gluon-yes-asu_Tags" {
  name = "Tags"

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

  role = "gluon-yes-asu"
}

resource "aws_iam_role_policy" "kinesis-dev_oneClick_firehose_delivery_role_1533136236524" {
  name = "oneClick_firehose_delivery_role_1533136236524"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "glue:GetTableVersions"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": ""
    },
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
        "arn:aws:s3:::kinesis-dev",
        "arn:aws:s3:::kinesis-dev/*",
        "arn:aws:s3:::%FIREHOSE_BUCKET_NAME%",
        "arn:aws:s3:::%FIREHOSE_BUCKET_NAME%/*"
      ],
      "Sid": ""
    },
    {
      "Action": [
        "lambda:InvokeFunction",
        "lambda:GetFunctionConfiguration"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:lambda:us-east-1:633944440063:function:%FIREHOSE_DEFAULT_FUNCTION%:%FIREHOSE_DEFAULT_VERSION%",
      "Sid": ""
    },
    {
      "Action": [
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:633944440063:log-group:/aws/kinesisfirehose/infra:log-stream:*"
      ],
      "Sid": ""
    },
    {
      "Action": [
        "kinesis:DescribeStream",
        "kinesis:GetShardIterator",
        "kinesis:GetRecords"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kinesis:us-east-1:633944440063:stream/infra",
      "Sid": ""
    },
    {
      "Action": [
        "kms:Decrypt"
      ],
      "Condition": {
        "StringEquals": {
          "kms:ViaService": "kinesis.us-east-1.amazonaws.com"
        },
        "StringLike": {
          "kms:EncryptionContext:aws:kinesis:arn": "arn:aws:kinesis:us-east-1:633944440063:stream/infra"
        }
      },
      "Effect": "Allow",
      "Resource": [
        "arn:aws:kms:region:accountid:key/%SSE_KEY_ARN%"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "kinesis-dev"
}

resource "aws_iam_role_policy" "kinesis-dev_oneClick_firehose_delivery_role_1533138576268" {
  name = "oneClick_firehose_delivery_role_1533138576268"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "glue:GetTableVersions"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": ""
    },
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
        "arn:aws:s3:::kinesis-dev",
        "arn:aws:s3:::kinesis-dev/*",
        "arn:aws:s3:::%FIREHOSE_BUCKET_NAME%",
        "arn:aws:s3:::%FIREHOSE_BUCKET_NAME%/*"
      ],
      "Sid": ""
    },
    {
      "Action": [
        "lambda:InvokeFunction",
        "lambda:GetFunctionConfiguration"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:lambda:us-east-1:633944440063:function:%FIREHOSE_DEFAULT_FUNCTION%:%FIREHOSE_DEFAULT_VERSION%",
      "Sid": ""
    },
    {
      "Action": [
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:logs:us-east-1:633944440063:log-group:/aws/kinesisfirehose/infra-dev:log-stream:*"
      ],
      "Sid": ""
    },
    {
      "Action": [
        "kinesis:DescribeStream",
        "kinesis:GetShardIterator",
        "kinesis:GetRecords"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:kinesis:us-east-1:633944440063:stream/%FIREHOSE_STREAM_NAME%",
      "Sid": ""
    },
    {
      "Action": [
        "kms:Decrypt"
      ],
      "Condition": {
        "StringEquals": {
          "kms:ViaService": "kinesis.%REGION_NAME%.amazonaws.com"
        },
        "StringLike": {
          "kms:EncryptionContext:aws:kinesis:arn": "arn:aws:kinesis:%REGION_NAME%:633944440063:stream/%FIREHOSE_STREAM_NAME%"
        }
      },
      "Effect": "Allow",
      "Resource": [
        "arn:aws:kms:region:accountid:key/%SSE_KEY_ARN%"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "kinesis-dev"
}

resource "aws_iam_role_policy" "lambda-infra_autoscaling-DescribeLoadBalancersAndAutoScalingGroups" {
  name = "autoscaling-DescribeLoadBalancersAndAutoScalingGroups"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "autoscaling:DescribeAutoScalingGroups",
        "autoscaling:DescribeLoadBalancers"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "lambda-infra"
}

resource "aws_iam_role_policy" "lambda-infra_cloudformation-ListStackResources" {
  name = "cloudformation-ListStackResources"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "cloudformation:ListStackResources",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "lambda-infra"
}

resource "aws_iam_role_policy" "lambda-infra_ec2-CreateAndDescribeTags" {
  name = "ec2-CreateAndDescribeTags"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:DescribeInstances",
        "ec2:DescribeTags",
        "ec2:CreateTags"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "lambda-infra"
}

resource "aws_iam_role_policy" "lambda-infra_elasticbeanstalk-DescribeEnvironmentsResources" {
  name = "elasticbeanstalk-DescribeEnvironmentsResources"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "elasticbeanstalk:DescribeEnvironmentResources",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "lambda-infra"
}

resource "aws_iam_role_policy" "lambda-infra_sqs-ListDeleteQueues" {
  name = "sqs-ListDeleteQueues"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "sqs:ListQueues",
        "sqs:DeleteQueue"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "lambda-infra"
}

resource "aws_iam_role_policy" "lambda-infra_sqs-SendMessage" {
  name = "sqs-SendMessage"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sqs:SendMessage",
      "Effect": "Allow",
      "Resource": "arn:aws:sqs:us-east-1:826187709569:asu-notifications",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "lambda-infra"
}

resource "aws_iam_role_policy" "lambda_war_deploy_oneClick_lambda_basic_execution_1524480506018" {
  name = "oneClick_lambda_basic_execution_1524480506018"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "logs:CreateLogStream",
        "route53:*",
        "ecs:*",
        "ec2:*",
        "codepipeline:*",
        "logs:CreateLogGroup",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "lambda_war_deploy"
}

resource "aws_iam_role_policy" "unitytemplate-ecs_ECS" {
  name = "ECS"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeregisterContainerInstance",
        "ecs:DiscoverPollEndpoint",
        "ecs:Poll",
        "ecs:RegisterContainerInstance",
        "ecs:StartTelemetrySession",
        "ecs:UpdateContainerInstancesState",
        "ecs:Submit*",
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  role = "unitytemplate-ecs"
}

resource "aws_iam_role_policy" "unitytemplate-ecs_SNS" {
  name = "SNS"

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

  role = "unitytemplate-ecs"
}

resource "aws_iam_role_policy" "unitytemplate-ecs_SQS" {
  name = "SQS"

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

  role = "unitytemplate-ecs"
}

resource "aws_iam_role_policy" "unitytemplate-ecs_Tags" {
  name = "Tags"

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

  role = "unitytemplate-ecs"
}
