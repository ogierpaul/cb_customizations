SELECT
dim_invoice,
1000000000 * amount as new_amount_in_monkey,
supplier_id
FROM {{ref('invoices_dc9')}}