resource "aws_iam_group" "GameDesigners" {
  name = "GameDesigners"
  path = "/"
}

resource "aws_iam_group" "admin" {
  name = "admin"
  path = "/"
}

resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}

resource "aws_iam_group" "developers_admin" {
  name = "developers_admin"
  path = "/"
}

resource "aws_iam_group" "war_client_eng" {
  name = "war_client_eng"
  path = "/"
}
