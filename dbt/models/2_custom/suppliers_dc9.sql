SELECT
{{dbt_utils.star(ref('suppliers_raw'), relation_alias='a', except=['supplier_name'])}},
COALESCE(b.custom_supplier_name, a.supplier_name) as supplier_name

FROM
{{ref('suppliers_raw')}} AS a
LEFT JOIN {{ref('custom_supplier_names')}} b on a.supplier_id = b.supplier_id