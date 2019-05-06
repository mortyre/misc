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
