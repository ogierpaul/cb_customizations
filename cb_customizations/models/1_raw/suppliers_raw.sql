SELECT
supplier_id,
name as supplier_name,
country as supplier_country
FROM {{source('cb_general', 'suppliers')}}