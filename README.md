# Infrastructure as Code & Terraform 101

## Who am I?

My name is Kristoffer Ahl. I've been working as a developer for about 18 years.
In recent years I've been moving into the space of cloud infrastructure, automation and developer operations.
I currently work at Dotnet Mentor as a consultant and DevOps Engineer.

## What is Infrastructure as Code

Infrastructure as Code, or IaC for short, is often referred to as `programmable infrastructure`.

It's not a "new" thing! The ideas have been around a long time (10 years or so).

The practice of using code to **describe**, **create**, and **manage** infrastructure so that it can be **versioned**, **tested** and **automated**.

### Key practices:

- Create definition files (describing desired state of infrastructure)
- Put everything in source control
- Prove production readiness (by automating provisioning, testing and delivery of changes)

### Goals of IaC:

- Rebuild any part of the infrastructure at any time
- Everything configured consistently
- Repeatable process
- Assume everything will change

## Why Infrastructure as Code

### Looking back

- On Premise
- Hosting service

### What do you get using the traditional approach?

- Time consuming ordering process
- Long lead times (not very agile. requires planning months/years ahead)
- Manual setup (time consuming and error prone)
- Not correctly configured (repeat process)
- Poor documentation (done manually if done at all)
- Configuration drift and snowflake instances
- Downtime for patching and updating (scary, error prone, and usually done directly in production)

### Reasons for change

- Time to market
- High availability
- Scale
- Agility

### The Cloud

- Agility: Self service, infinite scale
- API's: Enables programmable infrastructure and automation
- Hybrid Cloud / SaaS / FaaS (cloud 2.0)
- More resources to manage (more problems)

### Summary

- Use existing tools and practices
- A source of knowledge
- Versioned
- Enables collaboration
- Executable
- Repeatable
- Risk management
- Automatic documentation and change log
- Agility
- Security
- Immutability

## Introducing Terraform

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently.   
Terraform can manage existing and popular service providers as well as custom in-house solutions.

Describes infrastructure using HCL - HashiCorp Configuration Language
- `*.tf` files


## Core concepts

### Resources
  - Virtual machine
  - Load balancer
  - Private or public subnet
  - ...
  - Has attributes

### Providers
Responsible for creating and managing resources)

- AWS
- Azure
- Google Cloud
- Digital Ocean
- ...

### Terraform workflow

- Write
- Plan (Creates an execution plan, by building a resource graph)
- Apply (Creates, modifies, destroys infrastructure and outputs the state of the resource)

## Installing terraform

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
terraform init        # Downloads providers and initializes backends
terraform apply       # Creates, updates and destroys resource to match the desired state
terraform destroy     # Destroys created resources
```

## DEMO TIME

### 01 - init, apply, destroy

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

### 02 - Multiple resources and interpolation

**main.tf**
```terraform
resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}
```

## 03 - Variables

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

## 04 - Outputs

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

## 05 - Modules
- Simply a directory containing `.tf` files
- Common file structure
  ```bash
  main.tf
  variables.tf
  outputs.tf
  ```
- Local modules
- [Public terraform registry](https://registry.terraform.io/)
- Git repository

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

## 06 - Remote state
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

## Challenges with terraform
- ...

## Tips and tricks
- `terraform fmt`
- `terraform import`
