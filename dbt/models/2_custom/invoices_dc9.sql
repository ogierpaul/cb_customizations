SELECT
{{dbt_utils.star(ref('invoices_raw'), relation_alias='a')}}

FROM
{{ref('invoices_raw')}} AS a

// Customization example: adding a filtering clause
WHERE
a.supplier_id <> 1