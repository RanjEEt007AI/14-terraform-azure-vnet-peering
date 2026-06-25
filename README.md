# Terraform Azure VNET Peering

## Overview

This project creates two Azure Virtual Networks (VNETs) and connects them using VNET Peering in Microsoft Azure using simple Terraform code.

## Resources Created

* Resource Group
* Virtual Network 1 (VNET1)
* Virtual Network 2 (VNET2)
* VNET1 → VNET2 Peering
* VNET2 → VNET1 Peering

## Project Structure

```text
14-terraform-azure-vnet-peering-simple/
│
├── main.tf
├── provider.tf
├── .gitignore
└── README.md
```

## Prerequisites

* Terraform installed
* Azure account
* Azure CLI installed
* Logged into Azure

## Login to Azure

```bash
az login
```

## Initialize Terraform

```bash
terraform init
```

## Validate Configuration

```bash
terraform validate
```

## Generate Execution Plan

```bash
terraform plan
```

## Deploy Resources

```bash
terraform apply -auto-approve
```

## Notes

* VNET Peering enables communication between two virtual networks.
* Traffic between peered VNets uses Azure backbone network.
* Both VNets can communicate privately after peering is established.

## Author

Ranjeet Kumar
