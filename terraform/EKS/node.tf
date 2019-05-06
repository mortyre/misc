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

### Worker Node AutoScaling Group

data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-${aws_eks_cluster.war-dev-eks.version}-v*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon EKS AMI Account ID
}

# This data source is included for ease of sample architecture deployment
# and can be swapped out as necessary.
data "aws_region" "current" {}

# EKS currently documents this required userdata for EKS worker nodes to
# properly configure Kubernetes applications on the EC2 instance.
# We utilize a Terraform local here to simplify Base64 encoding this
# information into the AutoScaling Launch Configuration.
# More information: https://docs.aws.amazon.com/eks/latest/userguide/launch-workers.html
locals {
  demo-node-userdata = <<USERDATA
#!/bin/bash
set -o xtrace
sleep 60
TAG_NAME="Environment"
INSTANCE_ID="`wget -qO- http://instance-data/latest/meta-data/instance-id`"
REGION="eu-central-1"
TAG_VALUE="qwer"
TAG_VALUE=$(aws ec2 describe-tags --region $REGION --filters "Name=resource-id,Values=$INSTANCE_ID" | jq '.Tags[] | select(.Key == "Environment") | .Value' | sed 's/"//g')

/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.war-dev-eks.endpoint}' --b64-cluster-ca '${aws_eks_cluster.war-dev-eks.certificate_authority.0.data}' '${var.cluster-name}' --kubelet-extra-args --node-labels=env=$TAG_VALUE
USERDATA
}

resource "aws_launch_configuration" "launch_conf" {
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.war-dev-gameplay.name}"
  image_id                    = "${data.aws_ami.eks-worker.id}"
  instance_type               = "m4.large"
  name_prefix                 = "war-dev-gameplay"
  security_groups             = ["${aws_security_group.war-dev-gameplay.id}"]
  user_data_base64            = "${base64encode(local.demo-node-userdata)}"
  spot_price                  = "0.04"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg_env" {
  count                = "${length(var.env)}"
  desired_capacity     = 1
  launch_configuration = "${aws_launch_configuration.launch_conf.name}"
  max_size             = 1
  min_size             = 1
  name                 = "war-${var.env[count.index]}"

  vpc_zone_identifier = ["${data.aws_subnet_ids.public.ids}"]

  tag {
    key                 = "Name"
    value               = "war-node-${var.env[count.index]}"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }

  tag {
    key                 = "Gamelong"
    value               = "${var.tags["Gamelong"]}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "${var.env[count.index]}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Studio"
    value               = "${var.tags["Studio"]}"
    propagate_at_launch = true
  }
}

locals {
  demo-node-userdata-dashboard = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.war-dev-eks.endpoint}' --b64-cluster-ca '${aws_eks_cluster.war-dev-eks.certificate_authority.0.data}' '${var.cluster-name}'
USERDATA
}

resource "aws_launch_configuration" "launch_conf_dashboard" {
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.war-dev-gameplay.name}"
  image_id                    = "${data.aws_ami.eks-worker.id}"
  instance_type               = "m4.large"
  name_prefix                 = "war-dev-gameplay"
  security_groups             = ["${aws_security_group.war-dev-gameplay.id}"]
  user_data_base64            = "${base64encode(local.demo-node-userdata-dashboard)}"
  spot_price                  = "0.04"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg_env_dashboard" {
  desired_capacity     = 1
  launch_configuration = "${aws_launch_configuration.launch_conf_dashboard.name}"
  max_size             = 1
  min_size             = 1
  name                 = "war-k8s-dashboard"

  vpc_zone_identifier = ["${data.aws_subnet_ids.public.ids}"]

  tag {
    key                 = "Name"
    value               = "war-node-dashboard"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }

  tag {
    key                 = "Gamelong"
    value               = "${var.tags["Gamelong"]}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "${var.tags["Environment"]}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Studio"
    value               = "${var.tags["Studio"]}"
    propagate_at_launch = true
  }
}

locals {
  config_map_aws_auth = <<CONFIGMAPAWSAUTH


apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: ${aws_iam_role.war-dev-gameplay.arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
CONFIGMAPAWSAUTH
}

output "config_map_aws_auth" {
  value = "${local.config_map_aws_auth}"
}

locals {
  kubeconfig = <<KUBECONFIG


apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.war-dev-eks.endpoint}
    certificate-authority-data: ${aws_eks_cluster.war-dev-eks.certificate_authority.0.data}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "${var.cluster-name}"
KUBECONFIG
}

output "kubeconfig" {
  value = "${local.kubeconfig}"
}
