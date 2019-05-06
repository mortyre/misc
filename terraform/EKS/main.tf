### EKS Security Group
resource "aws_security_group" "war-eks-cluster" {
  name        = "${var.cluster-name}"
  description = "Cluster communication with worker nodes"
  vpc_id      = "${data.aws_vpc.game_vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(var.tags, map("Name", var.cluster-name))}"
}

resource "aws_eks_cluster" "war-dev-eks" {
  #  enabled_cluster_log_types = ["api", "audit"]
  name     = "${var.cluster-name}"
  role_arn = "${var.eks_arn}"

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false
    subnet_ids              = ["${data.aws_subnet_ids.public.ids}", "${data.aws_subnet_ids.private.ids}"]

    security_group_ids = ["${aws_security_group.war-eks-cluster.id}"]
  }
}

output "endpoint" {
  value = "${aws_eks_cluster.war-dev-eks.endpoint}"
}

#
#output "kubeconfig-certificate-authority-data" {
#  value = "${aws_eks_cluster.example.certificate_authority.0.data}"
#}

