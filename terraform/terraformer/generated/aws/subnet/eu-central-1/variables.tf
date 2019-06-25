data "terraform_remote_state" "vpc" {
  backend = "local"

  config {
    path = "../../../../generated/aws/vpc/eu-central-1/terraform.tfstate"
  }
}
