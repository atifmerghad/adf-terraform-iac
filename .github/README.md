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
2. Add federated credential: GitHub → your repo → `environment:dev` (or `ref:refs/heads/main`).
3. Grant the Service Principal **Contributor** on the subscription or resource group (see below).
4. Add `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID` as secrets.

## Grant app access (role assignment)

If GitHub Actions fails with "No subscriptions found", the app has no role assignment. Grant **Contributor**:

**Check existing assignments:**
```bash
APP_ID="<your Application (client) ID>"
az role assignment list --assignee "$APP_ID" -o table
```

**Create role assignment (subscription scope):**
```bash
az role assignment create \
  --assignee "$APP_ID" \
  --role "Contributor" \
  --scope "/subscriptions/<YOUR_SUBSCRIPTION_ID>"
```

**Or resource-group scope only:**
```bash
az role assignment create \
  --assignee "$APP_ID" \
  --role "Contributor" \
  --resource-group "<RESOURCE_GROUP_NAME>"
```

## Workflows

- **terraform.yml** – Init / fmt / plan only (no `apply` by default).
- **adf-deploy.yml** – Deploy ADF JSON (datasets, dataflows, pipelines) when `adf/` changes.

## How to get values for secrets

From your local machine (with Azure CLI installed and logged in with `az login`):

- **Subscription ID** (`AZURE_SUBSCRIPTION_ID`):

  ```bash
  az account show --query id -o tsv
  ```

- **Resource group name** (`RESOURCE_GROUP_NAME`):

  ```bash
  az group list -o table
  ```

- **Data Factory name** (`DATA_FACTORY_NAME`):

  ```bash
  az datafactory list -g <RESOURCE_GROUP_NAME> --query "[].name" -o tsv
  ```

`SQL_ADMIN_PASSWORD` should be the same password you used in `infra/terraform.tfvars` (or when you ran Terraform locally).

## Enable infra creation from CI

By default, Terraform does **not** apply changes from GitHub Actions (infra is expected to be created manually).

To let CI create/update infra:

1. Open `.github/workflows/terraform.yml`.
2. Find the commented **Terraform Apply** step at the bottom.
3. Uncomment that step:
   - Remove the leading `#` on the `- name: Terraform Apply` block.
4. Commit and push – future runs on `main` will run `terraform apply` using the saved `tfplan`.
