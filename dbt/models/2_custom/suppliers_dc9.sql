SELECT
//customization case: column definition: Changing the definition of a standard field
{{dbt_utils.star(ref('suppliers_raw'), relation_alias='a', except=['supplier_name'])}},
COALESCE(b.custom_supplier_name, a.supplier_name) as supplier_name

FROM
{{ref('suppliers_raw')}} AS a
//customization case: Referencing another custom table
LEFT JOIN {{ref('custom_supplier_names')}} b on a.supplier_id = b.supplier_id