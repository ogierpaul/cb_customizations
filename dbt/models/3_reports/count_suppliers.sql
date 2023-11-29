// Customization: creating a new model from standard data
SELECT

COUNT(*) as count_suppliers

FROM {{ref('suppliers_raw')}}