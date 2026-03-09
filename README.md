# Azure Data Factory - Infrastructure

Terraform IaC for Azure Data Factory. Pipeline logic is managed separately via ADF JSON and CI/CD.

| Folder   | Purpose                                      |
| -------- | -------------------------------------------- |
| `infra/` | Terraform (infrastructure)                    |
| `adf/`   | ADF JSON definitions (pipelines, datasets…)   |

## Services

```
resource_group
├── storage_account
│   └── storage_container
├── sql_server
│   └── sql_database
└── data_factory
    ├── linked_service_blob_storage
    ├── linked_service_azure_sql
    └── integration_runtime_azure
```

## Quick Start

```bash
az login
az account list --output table
az account set --subscription "<SUBSCRIPTION_ID>"

cd infra
terraform init
terraform plan -var-file=env/dev/terraform.tfvars
terraform apply -var-file=env/dev/terraform.tfvars
terraform graph | dot -Tsvg > graph.svg
```

## Prerequisites

- [Terraform](https://terraform.io)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/)
- Graphviz (`brew install graphviz` for `terraform graph`)

## GitHub Actions

See [.github/README.md](.github/README.md) for workflow setup and required secrets.
