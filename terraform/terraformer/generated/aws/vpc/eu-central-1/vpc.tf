resource "aws_vpc" "vpc-0d17c6eba35c1bc9b" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "10.204.32.0/20"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"

  tags {
    Environment = "development"
    Gamelong    = "Whalekit"
    Name        = "Whalekit"
    Studio      = "moscow"
  }
}

resource "aws_vpc" "vpc-98e531f3" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "172.31.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"

  tags {
    Name = "default"
  }
}
