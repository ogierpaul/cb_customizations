SELECT
{{dbt_utils.star(ref('suppliers_raw'), relation_alias='a')}}

FROM
{{ref('suppliers_raw')}} AS a