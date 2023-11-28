dbt run --select "state:modified" --defer --state=artifacts/stage
dbt ls --select "state:modified" --defer --state=artifacts/stage 
dbt compile
dbt ls --select "state:modified" --state=artifacts/stage 