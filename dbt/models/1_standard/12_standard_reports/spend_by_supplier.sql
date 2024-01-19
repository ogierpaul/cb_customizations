WITH invoices AS (
SELECT
    a.supplier_id,
    a.amount
FROM {{ref('invoices_dc9')}} as a
),
suppliers AS (
SELECT
    b.supplier_id,
    b.supplier_name
FROM {{ref('suppliers_dc9')}} as b
),
joined as (
    SELECT
    i.supplier_id,
    s.supplier_id,
    i.amount,
    s.supplier_name
    FROM invoices as i
    LEFT JOIN suppliers as s ON i.supplier_id = s.supplier_id
)
SELECT
joined.supplier_name,
SUM(joined.AMOUNT) as amount
FROM joined
GROUP BY supplier_name