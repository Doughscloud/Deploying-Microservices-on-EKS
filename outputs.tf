output "cluster_id" {
  description = "EKS cluster ID"
  value       = data.aws_eks_cluster.main.id
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = data.aws_eks_cluster.main.arn
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = data.aws_eks_cluster.main.endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = data.aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

output "cluster_iam_role_name" {
  description = "IAM role name associated with EKS cluster"
  value       = data.aws_iam_role.eks_cluster.name
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = data.aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_primary_security_group_id" {
  description = "The cluster primary security group ID created by EKS on the EKS cluster"
  value       = data.aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

output "node_groups" {
  description = "EKS node groups"
  value = {
    standard-workers = {
      arn    = data.aws_eks_node_group.main.arn
      name   = data.aws_eks_node_group.main.node_group_name
      status = data.aws_eks_node_group.main.status
    }
  }
}

output "vpc_id" {
  description = "ID of the VPC where the cluster is deployed"
  value       = data.aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = data.aws_vpc.main.cidr_block
}

output "subnets" {
  description = "List of all subnet IDs"
  value       = data.aws_subnets.all.ids
}

output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${data.aws_eks_cluster.main.name}"
}
