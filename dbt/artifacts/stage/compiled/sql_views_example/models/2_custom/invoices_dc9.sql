SELECT
a."DIM_INVOICE",
  a."SUPPLIER_ID",
  a."AMOUNT"

FROM
CB_DEV.STG.invoices_raw AS a