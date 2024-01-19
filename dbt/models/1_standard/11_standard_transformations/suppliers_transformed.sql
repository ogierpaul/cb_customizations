SELECT
supplier_id::INT AS supplier_id,
name::TEXT as supplier_name,
country::TEXT as supplier_country
FROM {{ref('seeds_source_suppliers')}}