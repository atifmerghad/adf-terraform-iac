# ADF JSON Definitions

Developer artifacts for Azure Data Factory. Deploy via CI/CD to the Data Factory in `infra/`.

## Structure

```
adf/
├── datasets/          # Blob (employees, departments) + SQL sink
├── dataflows/         # df_employees_join: INNER JOIN → SELECT → SQL
├── pipelines/         # pl_load_employees: runs the Data Flow
├── sample/            # Sample JSON files (upload to blob raw/)
└── sql/               # create_table.sql (run in SQL DB first)
```

## Flow

```
employees.json ──┐
                 ├─► INNER JOIN (department_id) ─► SELECT ─► SQL TRUNCATE+LOAD
departments.json─┘
```

## Setup

1. Create the SQL table: run `sql/create_table.sql` in your Azure SQL Database.
2. Upload `sample/employees.json` and `sample/departments.json` to blob `raw/` folder.
3. Deploy datasets, dataflow, pipeline via CI/CD or ADF UI.
