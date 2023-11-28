SELECT
dim_invoice,
supplier_id,
amount
FROM {{source('cb_general', 'invoices')}}