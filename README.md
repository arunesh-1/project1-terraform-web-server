# Project 1: Terraform EC2 web server

Terraform creates a public subnet, route table, security group, and Amazon Linux
EC2 instance in an existing default VPC in Mumbai. It uses the VPC's existing
internet gateway. A Bash startup script installs Apache and serves a demo page.
Port 80 is public; no inbound SSH (22) or RDP (3389) is configured.

This project **reuses** the default VPC because the account's VPC quota was
reached. It therefore does not meet the original requirement to create a VPC.
HTTP traffic is unencrypted; this is a demo, not a production configuration.

## Deploy

Prerequisites: Terraform, AWS CLI, Git, an authenticated AWS identity, and
approval to use the default VPC. Check its CIDR and all existing subnets before
selecting a non-overlapping IPv4 CIDR for the new subnet. AWS resources incur
charges. Use `ap-south-1`.

```powershell
terraform init
terraform plan -var "subnet_cidr=YOUR_UNUSED_CIDR" -out=tfplan
terraform apply tfplan
terraform output -raw website_url
```

Replace `YOUR_UNUSED_CIDR` with a subnet within the default VPC that does not
overlap any existing subnet. Review the plan before applying. Wait a few
minutes for the instance to install Apache, then open the output URL.

Local Terraform state must be retained for later updates and cleanup; do not
commit state, plan files or credentials. After collecting evidence, run
`terraform destroy -var "subnet_cidr=YOUR_UNUSED_CIDR"` and review the plan.
