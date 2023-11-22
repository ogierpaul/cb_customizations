SELECT SUM(AMOUNT) AS AMOUNT
FROM {{ref('invoices_raw')}}