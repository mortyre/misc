resource "aws_iam_role" "war-eks-cluster" {
  name = "war-eks-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_security_group" "war-eks-cluster" {
  name        = "war-eks-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = "${aws_vpc.demo.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-eks-demo"
  }
}

resource "aws_eks_cluster" "war-dev-gameplay" {
  #  enabled_cluster_log_types = ["api", "audit"]
  name     = "war-dev-gameplay"
  role_arn = "${var.eks_arn}"

  vpc_config {
    #subnet_ids = ["subnet-d74d1af8", "subnet-607c4504"]

    subnet_ids = ["${data.aws_subnet_ids.public.ids}"]

    #security_group_ids = 
  }
}

#output "endpoint" {
#  value = "${aws_eks_cluster.example.endpoint}"
#}
#
#output "kubeconfig-certificate-authority-data" {
#  value = "${aws_eks_cluster.example.certificate_authority.0.data}"
#}

