# ==== GAME NAMING VARIABLES
variable "tags" {
  default = {
    "Gamelong"    = "YellowScooter"
    "Environment" = "development"
    "Studio"      = "moscow"
  }
}

variable "eks_arn" {
  default = "arn:aws:iam::633944440063:role/eks-manage"
}

data "aws_vpc" "game_vpc" {
  tags {
    Gamelong = "Whalekit"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.game_vpc.id}"

  tags {
    Studio   = "${var.tags["Studio"]}"
    Gamelong = "Whalekit"
    Type     = "private"
  }
}
