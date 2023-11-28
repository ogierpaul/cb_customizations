SELECT
{{dbt_utils.star(ref('invoices_raw'), relation_alias='a')}}

FROM
{{ref('invoices_raw')}} AS a