SELECT
dim_invoice::INT AS dim_invoice,
supplier_id::INT AS supplier_id,
amount::FLOAT as amount,
1.25 * amount ::FLOAT as amount_usd
FROM {{ref('seeds_source_invoices')}}