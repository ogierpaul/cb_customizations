SELECT
sum(amount) as amount
FROM {{ref('invoices_dc9')}}