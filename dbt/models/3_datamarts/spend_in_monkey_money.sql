SELECT
supplier_id,
100 * amount as amount_in_monkey_money
FROM
{{ref('invoices_dc9')}}