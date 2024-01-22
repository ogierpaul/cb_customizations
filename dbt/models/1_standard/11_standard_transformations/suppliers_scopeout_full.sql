SELECT
a.supplier_id,
COALESCE(b.supplier_scope_out, FALSE) as supplier_scope_out
FROM
{{ref('suppliers_transformed')}} as a
LEFT JOIN
{{ref('suppliers_scopeout')}} as b ON a.supplier_id = b.supplier_id

