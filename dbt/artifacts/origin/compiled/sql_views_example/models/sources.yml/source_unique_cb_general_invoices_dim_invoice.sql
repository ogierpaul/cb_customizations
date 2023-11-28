
    
    

select
    dim_invoice as unique_field,
    count(*) as n_records

from cb_general.public.invoices
where dim_invoice is not null
group by dim_invoice
having count(*) > 1


