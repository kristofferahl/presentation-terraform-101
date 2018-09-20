# Terraform 101

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.   
Terraform can manage existing and popular service providers as well as custom in-house solutions.

## Core concepts

- Infrastructure as Code
  - Versioned
  - Repeatable
- Describes infrastructure using HCL - HashiCorp Configuration Language
  - `*.tf` files
- Resources
  - Virtual machine
  - Private or public subnet
  - Load balancer
  - ...
  - Has arguments and attributes
- Providers (responsible for creating and managing resources)
  - AWS
  - Azure
  - Google Cloud
  - ...
- Execution plan
- Resource graph
- State

## Installation

```bash
brew install terraform

```

### Syntax highlighting

#### Atom

```bash
apm install language-terraform

```

## Basic syntax

**main.tf**
```terraform
provider "aws" {
  access_key = "ACCESS_KEY_HERE"
  secret_key = "SECRET_KEY_HERE"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}
```

## Basic commands

```bash
terraform init        # Downloads providers and initializez backends
terraform plan        # Outputs changes that would be made when running apply
terraform apply       # Creates, updates and destroys resource to match the desired state
terraform destroy     # Destroys created resources
```

### Multiple resources

**main.tf**
```terraform
resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
```

## Variables

**variables.tf**
```terraform
variable "instance_ami" {
  default = "ami-2757f631"
}

variable "instance_type" {
  default = "t2.micro"
}
```

**main.tf**
```terraform
resource "aws_instance" "example" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"
}
```

## Outputs

**outputs.tf**
```terraform
output "private_ip" {
  value = "${aws_eip.ip.private_ip}"
}

output "public_ip" {
  value = "${aws_eip.ip.public_ip}"
}
```

```bash
terraform output
terraform output public_ip
```

## Modules
- Simply a directory containing .tf files
- Common file structure
  ```bash
  - main.tf
  - variables.tf
  - outputs.tf
  ```
- Local modules
- Public registry
- Git repository support

### Module syntax
```terraform
module "my_vpc" {
  source = "./vpc"

  aws_region          = "us-east-1"
  availability_zones  = ["a", "b", "c"]

  private_subnets     = true
  public_subnets      = true
}
```

## Remote state
- Backends
  - S3
  - Consul
  - ...

**main.tf**
```terraform
terraform {
  backend "s3" {
    bucket = "terraform-remote-state-bucket"
    key    = "path/to/state"
    region = "us-east-1"
  }
}
```

## Tips and tricks
- `terraform fmt`
- `terraform import`
