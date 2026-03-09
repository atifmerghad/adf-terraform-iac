# GitHub Actions

## Secrets (Repository → Settings → Secrets and variables → Actions)

| Secret | Description |
| ------ | ----------- |
| `AZURE_CLIENT_ID` | App Registration (Service Principal) Client ID |
| `AZURE_TENANT_ID` | Azure AD Tenant ID |
| `AZURE_SUBSCRIPTION_ID` | Azure Subscription ID |
| `SQL_ADMIN_PASSWORD` | SQL admin password (for Terraform) |
| `RESOURCE_GROUP_NAME` | Resource group name (for ADF deploy, e.g. `rg-adf-demo`) |
| `DATA_FACTORY_NAME` | Data Factory name (for ADF deploy, e.g. `adf-demo-terraform`) |

## OIDC Setup (recommended)

1. Create an App Registration in Azure AD.
2. Add federated credential: GitHub → your repo → `ref:refs/heads/main`.
3. Grant the Service Principal **Contributor** on the subscription or resource group.
4. Add `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID` as secrets.

## Workflows

- **terraform.yml** – Plan on PR, apply on push to `main` (when `infra/` changes).
- **adf-deploy.yml** – Deploy ADF JSON (datasets, dataflows, pipelines) when `adf/` changes.
