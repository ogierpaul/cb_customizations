SELECT
{{dbt_utils.star(ref('suppliers_transformed'), relation_alias='a')}}

FROM
{{ref('suppliers_transformed')}} AS a

WHERE
1=1