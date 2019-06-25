resource "aws_iam_group_membership" "GameDesigners" {
  group = "GameDesigners"
  name  = "GameDesigners"
  users = ["tsinitsyna", "mtumin", "araida", "eakimov", "dbalashova", "kdomareva", "pkuznetsov"]
}

resource "aws_iam_group_membership" "admin" {
  group = "admin"
  name  = "admin"
  users = ["szotova", "teamcity", "falaeddin", "dbodunov"]
}

resource "aws_iam_group_membership" "developers" {
  group = "developers"
  name  = "developers"
  users = ["esizov", "sshamkin", "rgutsenko", "mvoronov", "nperevozchikov", "vpalto"]
}

resource "aws_iam_group_membership" "developers_admin" {
  group = "developers_admin"
  name  = "developers_admin"
  users = ["sshamkin", "mvoronov", "nperevozchikov"]
}

resource "aws_iam_group_membership" "war_client_eng" {
  group = "war_client_eng"
  name  = "war_client_eng"
  users = ["ademin", "pivko", "rgonta", "okrasovskaya", "asergeyev"]
}
