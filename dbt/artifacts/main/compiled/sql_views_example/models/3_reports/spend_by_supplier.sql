

SELECT
b.supplier_name,
SUM(a.AMOUNT) as amount
FROM CB_DEV.DEV.invoices_dc9 as a
LEFT JOIN CB_DEV.DEV.suppliers_dc9 as b ON a.supplier_id = b.supplier_id
GROUP BY supplier_name