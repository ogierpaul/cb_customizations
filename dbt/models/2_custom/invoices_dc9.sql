SELECT
{{dbt_utils.star(ref('invoices_raw'), relation_alias='a')}}
,
20 as dummy_col
FROM
{{ref('invoices_raw')}} AS a