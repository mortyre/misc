resource "aws_subnet" "subnet-01622de804a347246" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.48.0/20"
  map_public_ip_on_launch         = false

  tags {
    Name = "private-eu-central-1a"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-98e531f3_id}"
}

resource "aws_subnet" "subnet-0163220427e6fcd23" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "10.204.34.0/24"
  map_public_ip_on_launch         = false

  tags {
    Environment = "development"
    Gamelong    = "Whalekit"
    Name        = "Whalekit-private-eu-central-1c"
    Studio      = "moscow"
    Type        = "private"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-0d17c6eba35c1bc9b_id}"
}

resource "aws_subnet" "subnet-03e5c9a3367b71576" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "10.204.32.0/24"
  map_public_ip_on_launch         = false

  tags {
    Environment = "development"
    Gamelong    = "Whalekit"
    Name        = "Whalekit-private-eu-central-1a"
    Studio      = "moscow"
    Type        = "private"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-0d17c6eba35c1bc9b_id}"
}

resource "aws_subnet" "subnet-04905d976782f444e" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "10.204.39.0/24"
  map_public_ip_on_launch         = false

  tags {
    Environment = "development"
    Gamelong    = "Whalekit"
    Name        = "Whalekit-elasticache-eu-central-1b"
    Studio      = "moscow"
    Type        = "elasticache"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-0d17c6eba35c1bc9b_id}"
}

resource "aws_subnet" "subnet-04f26a995acb818ca" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "10.204.33.0/24"
  map_public_ip_on_launch         = false

  tags {
    Environment = "development"
    Gamelong    = "Whalekit"
    Name        = "Whalekit-private-eu-central-1b"
    Studio      = "moscow"
    Type        = "private"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-0d17c6eba35c1bc9b_id}"
}

resource "aws_subnet" "subnet-059e9da7e60eb05bd" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "10.204.35.0/24"
  map_public_ip_on_launch         = false

  tags {
    Environment = "development"
    Gamelong    = "Whalekit"
    Name        = "Whalekit-public-eu-central-1a"
    Studio      = "moscow"
    Type        = "public"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-0d17c6eba35c1bc9b_id}"
}

resource "aws_subnet" "subnet-08b04d56b4639b414" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "10.204.36.0/24"
  map_public_ip_on_launch         = false

  tags {
    Environment = "development"
    Gamelong    = "Whalekit"
    Name        = "Whalekit-public-eu-central-1b"
    Studio      = "moscow"
    Type        = "public"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-0d17c6eba35c1bc9b_id}"
}

resource "aws_subnet" "subnet-09c458163126f6b72" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "10.204.40.0/24"
  map_public_ip_on_launch         = false

  tags {
    Environment = "development"
    Gamelong    = "Whalekit"
    Name        = "Whalekit-elasticache-eu-central-1c"
    Studio      = "moscow"
    Type        = "elasticache"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-0d17c6eba35c1bc9b_id}"
}

resource "aws_subnet" "subnet-0a0e6ec0d75583734" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "10.204.38.0/24"
  map_public_ip_on_launch         = false

  tags {
    Environment = "development"
    Gamelong    = "Whalekit"
    Name        = "Whalekit-elasticache-eu-central-1a"
    Studio      = "moscow"
    Type        = "elasticache"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-0d17c6eba35c1bc9b_id}"
}

resource "aws_subnet" "subnet-0d829fc9fc0468897" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.64.0/20"
  map_public_ip_on_launch         = false

  tags {
    Name = "private-eu-central-1b"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-98e531f3_id}"
}

resource "aws_subnet" "subnet-0f57e1426003c95f7" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "10.204.37.0/24"
  map_public_ip_on_launch         = false

  tags {
    Environment = "development"
    Gamelong    = "Whalekit"
    Name        = "Whalekit-public-eu-central-1c"
    Studio      = "moscow"
    Type        = "public"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-0d17c6eba35c1bc9b_id}"
}

resource "aws_subnet" "subnet-11d76d5c" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.0.0/20"
  map_public_ip_on_launch         = true

  tags {
    Name = "public-eu-central-1c"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-98e531f3_id}"
}

resource "aws_subnet" "subnet-5d4a9a20" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.32.0/20"
  map_public_ip_on_launch         = true

  tags {
    Name = "public-eu-central-1b"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-98e531f3_id}"
}

resource "aws_subnet" "subnet-b53ea7de" {
  assign_ipv6_address_on_creation = false
  cidr_block                      = "172.31.16.0/20"
  map_public_ip_on_launch         = true

  tags {
    Name = "public-eu-central-1a"
  }

  vpc_id = "${data.terraform_remote_state.vpc.aws_vpc_vpc-98e531f3_id}"
}
