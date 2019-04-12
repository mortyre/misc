provider "aws" {
  region  = "us-east-1"
  profile = "msk-dev"
}

variable "s_tags" {
  default = {
    "gameshort" = "zbs"
    "envshort"  = "dev4"
    "gameId"    = "zbs-dev-1"
  }
}

variable "threshold" {
  default = {
    "NetworkBytesIn" = "1000000000"
    "NetworkBytesOut" = "1000000000"
    "net_low"  = "100000"
    "CurrItems"     = "8000000"
    "FreeableMemory" = "2000000000"
    "CPUUtilization"      = "60"
    "memory"   = "2000000000"
  }
}

variable "metrics"{
  type = "list"
  default = [
  #  "CurrItems",
    "FreeableMemory",
    "CPUUtilization"
  ]
}

data "aws_elasticache_replication_group" "elasticache_clusters" {
  replication_group_id = "${var.s_tags["gameshort"]}-${var.s_tags["envshort"]}"
#  depends_on           = [
#    "aws_elasticache_replication_group.elasticache_redis_cluster"
#  ]
}
output "test" { 
  value = "${data.aws_elasticache_replication_group.elasticache_clusters.member_clusters}"
}


resource "aws_cloudwatch_metric_alarm" "elasticache_alarms_NetworkBytesOut" {
  count = "${length(data.aws_elasticache_replication_group.elasticache_clusters.member_clusters)}"
  alarm_name                = "NetworkBytesOut is high on ${data.aws_elasticache_replication_group.elasticache_clusters.member_clusters[count.index]}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "NetworkBytesOut"
  namespace                 = "AWS/ElastiCache"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "1000000"
  dimensions = {
    CacheClusterId = "${data.aws_elasticache_replication_group.elasticache_clusters.member_clusters[count.index]}"
  }
  alarm_actions = [
    "arn:aws:sns:us-east-1:633944440063:sstarkov_alarm"
  ]
  ok_actions = [
    "arn:aws:sns:us-east-1:633944440063:sstarkov_alarm"
  ]
}

