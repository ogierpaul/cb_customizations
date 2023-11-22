SELECT SUM(AMOUNT) AS AMOUNT
FROM {{ref('spend_by_supplier')}}