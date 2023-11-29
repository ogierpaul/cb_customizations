

SELECT
b.supplier_name,
SUM(a.AMOUNT) * 1.15 as amount
FROM CB_DEV.STG.invoices_dc9 as a
LEFT JOIN CB_DEV.STG.suppliers_dc9 as b ON a.supplier_id = b.supplier_id
GROUP BY supplier_name