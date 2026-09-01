# Day 1 — How Terraform Works

## What is Infrastructure as Code (IaC)?

Provisioning your infrastructure through code, instead of manual processes.

## Why Infrastructure as Code (IaC)?

- **Consistency** — identical environments across dev, staging, and production
- **Time efficiency** — automated provisioning saves hours of manual work
- **Cost management** — easy to track costs and automate cleanup
- **Scalability** — deploy to hundreds of servers with the same effort as one
- **Version control** — track infrastructure changes in Git
- **Reduced human error** — eliminate manual configuration mistakes
- **Collaboration** — teams can work together on infrastructure

## Tools for IaC

- **Terraform** — universal, most popular
- **Pulumi** — universal
- **Azure ARM** — Azure only
- **AWS CloudFormation, AWS CDK, AWS SAM** — AWS only
- **Deployment Manager, Config Controller/Connector** — GCP only

## Benefits of IaC

- Consistent environment deployment
- Easy to track and manage costs
- Write once, deploy many (single codebase)
- Time-saving automation
- Reduced human error
- Cost optimization through automation
- Version control for infrastructure changes
- Automated cleanup and scheduled destruction
- Developer focus shifts to application development
- Easy creation of identical production environments for troubleshooting

> `.tf` files use **HCL** (HashiCorp Configuration Language) — both machine-readable and human-readable.

## What is Terraform?

An Infrastructure as Code tool that helps automate infrastructure provisioning and management across multiple cloud providers.

## How Terraform Works

```
Write Terraform files → Run Terraform commands → Call AWS APIs through the Terraform Provider
```

### Terraform Workflow Phases

1. `terraform init` — initialize the working directory
2. `terraform validate` — validate the configuration files
3. `terraform plan` — create an execution plan
4. `terraform apply` — apply the changes to reach the desired state
5. `terraform destroy` — destroy the infrastructure when needed

Whenever these commands are executed, Terraform actually interacts with an API to perform the changes — e.g., the AWS API.

### Workflow Diagram

The diagram below shows the full flow: a DevOps engineer writes a `.tf` file, pushes it to GitHub, a CI/CD pipeline runs the `terraform init / validate / plan / apply` sequence, Terraform calls the AWS APIs to create/modify the infrastructure (e.g., a 3-tier application), and `terraform destroy` (run via CLI) tears it back down.

![Terraform workflow diagram](/days/day_01/assets_01/terraformday1.png)

## Installing Terraform

1. Installed Terraform by following the official instructions: https://developer.hashicorp.com/terraform/install
2. Confirmed the install by running:
   ```
   terraform -help
   ```
3. Set an alias so I don't have to type `terraform` every time (just use `tf`):
   ```
   alias tf=terraform
   ```
4. Enabled autocomplete for Terraform commands:
   ```
   terraform -install-autocomplete
   ```
5. (Optional) Installed the HashiCorp Terraform extension in VS Code.

## What are Terraform Providers?

Providers are **plugins** that allow Terraform to interact with cloud platforms, SaaS providers, and other APIs. For AWS, we use the `hashicorp/aws` provider.

Link: https://registry.terraform.io/?product_intent=terraform 

![Terraform Providers](/days/day_01/assets_01/Terraform_providers.png)

### Provider vs Terraform Core Version

- **Terraform Core** — the main Terraform binary that parses configuration and manages state

- **Provider Version** — individual plugins that communicate with specific APIs (AWS, Azure, Google Cloud, etc.)
- They have independent versioning and release cycles

### Why Version Matters

- **Compatibility** — ensure the provider works with your Terraform version
- **Stability** — pin to specific versions to avoid breaking changes
- **Features** — new provider versions add support for new AWS services
- **Bug fixes** — updates often include important security and bug fixes
- **Reproducibility** — same versions ensure consistent behavior across environments

### Version Constraints

Use version constraints to specify acceptable provider versions:

- `= 1.2.3` — exact version
- `>= 1.2` — greater than or equal to
- `<= 1.2` — less than or equal to
- `~> 1.2` — pessimistic constraint (allow patch releases)
- `>= 1.2, < 2.0` — range constraint

### Best Practices

1. Always specify provider versions
2. Use pessimistic constraints for stability
3. Test provider upgrades in development first
4. Document version requirements in your README
5. Use the `terraform providers lock` command for consistency

### Configuration Examples

**Basic provider configuration**

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

**Multiple provider versions**

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}
```

