SELECT
b.supplier_name,
SUM(a.AMOUNT) as amount
FROM {{ref('invoices_raw')}} as a
LEFT JOIN {{ref('suppliers_raw')}} as b ON a.supplier_id = b.supplier_id
GROUP BY supplier_name