{{config(materialized='view')}}

SELECT
b.supplier_name,
SUM(a.AMOUNT) * 1 as amount
FROM {{ref('invoices_dc9')}} as a
LEFT JOIN {{ref('suppliers_dc9')}} as b ON a.supplier_id = b.supplier_id
GROUP BY supplier_name