### EKS Security Group Cluster
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

### Worker Node Security Group
resource "aws_security_group" "war-dev-gameplay" {
  name        = "${var.node-name}"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${data.aws_vpc.game_vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${
    map(
     "Name", "${var.node-name}",
     "kubernetes.io/cluster/${var.cluster-name}", "owned",
     "kubernetes.io/role/internal-elb", "shared",
    )
  }"
}

resource "aws_security_group_rule" "war-dev-gameplay" {
  description              = "Allow node to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.war-dev-gameplay.id}"
  source_security_group_id = "${aws_security_group.war-dev-gameplay.id}"
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "war-dev-gameplay-control-panel" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.war-dev-gameplay.id}"
  source_security_group_id = "${aws_security_group.war-eks-cluster.id}"
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "war-dev-gameplay-upd-ports" {
  description = "udp ports for game"
  from_port   = 50000
  protocol    = "udp"

  security_group_id = "${aws_security_group.war-dev-gameplay.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]

  #cidr_blocks = "::/0"
  to_port = 50009

  type = "ingress"
}

### Worker Node Access to EKS Master Cluster

resource "aws_security_group_rule" "war-eks-clusterr-ingress-node-https" {
  description              = "Allow pods to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.war-eks-cluster.id}"
  source_security_group_id = "${aws_security_group.war-dev-gameplay.id}"
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "war-eks-clusterr-ingress-node-https-dashboard" {
  description       = "Allow to dasboard"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.war-eks-cluster.id}"
  cidr_blocks       = ["172.0.0.0/8"]
  to_port           = 443
  type              = "ingress"
}
