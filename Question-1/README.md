# Question-1: Azure SRE Storage Provisioning using Terraform

This Terraform project automates the provisioning of an Azure Storage Account and a private container using modular Terraform code.


## 📦 Resources Created

The following resources will be provisioned in **Azure West Europe**:

1. **Resource Group**
   - Name: `sre-challenge-flaschenpost`
   - Tags: `department = SRE`

2. **Storage Account**
   - Name: `srechallengeforflaschenpost`
   - SKU: `Standard_LRS`
   - Access Tier: `Hot`
   - Tags: `department = SRE`

3. **Blob Container**
   - Name: `sre`
   - Access Type: `Private`

---

## 📤 Outputs

The following outputs will be available after planning:

- `storage_account_id`
- `storage_account_primary_access_key`
- `storage_account_primary_connection_string`
- `storage_container_id`

---

## 🛠️ Prerequisites

- Terraform v1.0+
- Azure CLI (`az`) installed and logged in using `az login`
- An active Azure subscription

---

## 🚀 Usage

### Clone the repo
git clone https://github.com/tharak-ram1/SRE-Task.git

cd SRE-Task/Question-1/Azure_SRE_Storage

### Initialize Terraform
terraform init

### Format check (optional)
terraform fmt -check

### Validate Terraform configuration
terraform validate

### Preview the Terraform plan
terraform plan -var-file="terraform.tfvars"
