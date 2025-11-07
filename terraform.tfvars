# Terraform variables for EKS cluster
aws_region         = "us-east-1"
cluster_name       = "enterprise-cluster"
kubernetes_version = "1.32"
node_group_name    = "standard-workers"
instance_type      = "t3.medium"
desired_size       = 3
min_size           = 3
max_size           = 6
environment        = "production"
project           = "microservices-eks"

