SELECT
AVG(amount) as amount
from {{ref('invoices_dc9')}}