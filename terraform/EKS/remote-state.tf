terraform {
  backend "s3" {
    bucket  = "whalekit-dev-terraform-state"
    key     = "Warface/war-dev-gameplay/terraform.tfstate"
    region  = "us-east-1"
    profile = "msk-dev"
  }
}
