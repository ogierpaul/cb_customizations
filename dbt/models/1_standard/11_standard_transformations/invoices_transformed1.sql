SELECT
dim_invoice::INT AS dim_invoice,
supplier_id::INT AS supplier_id,
amount::FLOAT as amount
FROM {{ref('seeds_source_invoices')}}