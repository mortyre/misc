# ==== GAME NAMING VARIABLES
variable "tags" {
  default = {
    "Gamelong"    = "Whalekit"
    "Environment" = "development"
    "Studio"      = "moscow"
  }
}

variable "env" {
  default = ["preprod-a", "preprod-b", "qa", "review", "stage", "dev"]
}

variable "cluster-name" {
  default = "war-dev-gameplay-cluster"
  type    = "string"
}

variable "node-name" {
  default = "war-dev-gameplay-node"
  type    = "string"
}

variable "eks_arn" {
  default = "arn:aws:iam::633944440063:role/eks-manage"
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.game_vpc.id}"

  tags {
    Studio   = "${var.tags["Studio"]}"
    Gamelong = "Whalekit"
    Type     = "private"
  }
}

data "aws_vpc" "game_vpc" {
  tags {
    Gamelong = "${var.tags["Gamelong"]}"
  }
}

data "aws_subnet_ids" "public" {
  vpc_id = "${data.aws_vpc.game_vpc.id}"

  tags {
    Studio   = "${var.tags["Studio"]}"
    Gamelong = "Whalekit"
    Type     = "public"
  }
}
