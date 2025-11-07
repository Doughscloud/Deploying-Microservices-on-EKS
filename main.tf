# EKS Cluster Configuration
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Data source to get available AZs
data "aws_availability_zones" "available" {
  state = "available"
}

# VPC - Import existing VPC
data "aws_vpc" "main" {
  id = "vpc-0ed0675af020e9f46"
}

# Use existing subnets from eksctl
data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}

# Get existing subnets
data "aws_subnet" "subnets" {
  for_each = toset(data.aws_subnets.all.ids)
  id       = each.value
}

# Import existing security groups
data "aws_security_group" "eks_cluster" {
  id = "sg-09d65eba24b0538de"
}

# Import existing IAM roles
data "aws_iam_role" "eks_cluster" {
  name = "eksctl-enterprise-cluster-cluster-ServiceRole-usU1E3AlhmLV"
}

data "aws_iam_role" "eks_nodes" {
  name = "eksctl-enterprise-cluster-nodegrou-NodeInstanceRole-Oow0bWxpChdP"
}

# Import existing EKS Cluster
data "aws_eks_cluster" "main" {
  name = var.cluster_name
}

# Import existing EKS Node Group
data "aws_eks_node_group" "main" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
}

# Get existing EKS Add-ons
data "aws_eks_addon" "vpc_cni" {
  cluster_name = var.cluster_name
  addon_name   = "vpc-cni"
}

data "aws_eks_addon" "coredns" {
  cluster_name = var.cluster_name
  addon_name   = "coredns"
}

data "aws_eks_addon" "kube_proxy" {
  cluster_name = var.cluster_name
  addon_name   = "kube-proxy"
}
