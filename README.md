<<<<<<< HEAD
# Deploying Microservices on Amazon EKS

Infrastructure-as-code plus Helm charts for deploying a WordPress microservice stack on Amazon EKS, including autoscaling examples and gp3-backed storage. The repository packages Terraform data sources with reusable Helm assets to run workloads on an existing cluster.

## Repository Structure

- `main.tf`, `variables.tf`, `terraform.tfvars`, `outputs.tf` – Terraform configuration that imports an already-provisioned EKS control plane, node group, and supporting AWS resources so their metadata can be managed and inspected.
- `my-microservice/` – Reusable Helm chart scaffolded from the default Helm template, configured for containerized microservices (defaults to `nginx`).
- `custom-wordpress/` – Helm chart tailored for WordPress plus MariaDB, persistence, and ingress.
- `values.yaml`, `wordpress-values.yaml` – Sample Helm values for production-ready WordPress, including autoscaling, monitoring annotations, persistent storage, Redis, and MySQL.
- `simple-wordpress.yaml`, `quick-wordpress.yaml` – Raw Kubernetes manifests for quick testing of WordPress + MariaDB.
- `hpa.yaml`, `advanced-hpa.yaml` – Horizontal Pod Autoscaler examples (basic and advanced v2).
- `storage-class.yaml` – gp3-based storage class for persistent workloads.

## Getting Started

1. Ensure AWS CLI and `eksctl` are installed locally and authentication is configured (`aws configure`).
2. Run `terraform init` and `terraform plan` within the repo to verify Terraform can read the existing EKS resources referenced in `terraform.tfvars`.
3. Update kubeconfig for the cluster:
   ```bash
   aws eks update-kubeconfig --region us-east-1 --name enterprise-cluster
   ```
4. Deploy workloads via Helm:
   ```bash
   helm upgrade --install wordpress ./custom-wordpress -f values.yaml
   ```
   or apply sample manifests with `kubectl apply -f simple-wordpress.yaml`.

## Notes

- The repo assumes the cluster, VPC, and node group already exist; Terraform treats them as data sources.
- Sensitive secrets (e.g., database passwords) are stored in plain values for demonstration. Replace them with secure secrets management (Kubernetes Secrets, SSM Parameter Store, etc.) before production use.


=======
# Deploying-Microservices-on-EKS
Infrastructure-as-code plus Helm charts for deploying a WordPress microservice stack on Amazon EKS, including autoscaling examples and gp3-backed storage.
>>>>>>> origin/main
