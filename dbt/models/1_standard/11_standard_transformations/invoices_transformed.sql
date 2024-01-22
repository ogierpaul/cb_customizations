SELECT
i.dim_invoice,
i.supplier_id,
i.amount
FROM {{ref('invoices_transformed1')}} as i
LEFT JOIN {{ref('suppliers_scopeout_full')}} as b ON i.supplier_id = b.supplier_id
WHERE b.supplier_scope_out = FALSE