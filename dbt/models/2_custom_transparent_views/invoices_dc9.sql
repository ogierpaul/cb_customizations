SELECT
{{dbt_utils.star(ref('invoices_transformed'), relation_alias='a')}}

FROM
{{ref('invoices_transformed')}} AS a

WHERE
1=1