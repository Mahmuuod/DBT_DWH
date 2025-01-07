{{config(materialized='table')}}

with trans as(
    select * from {{ref('stg_staging__transaction')}}
)
prod_trans as
(
    select * from {{ref("stg_staging__product_transaction")}}
)
datee as
(
    select * from ref{{'DateDIM'}}
)
prods as
(
    select * from ref{{'stg_staging__product'}}
)
all_transacts as
(
    select transaction_id,quantity,customer_id,store_id,promotion_id,transaction_time,total_amount,transaction_date,product_id
    from trans inner join prod_trans on trans.transaction_id=prod_trans.transaction_id
)
select coalesce(max(transaction_surr),0)+1 as transaction_surr,
 date_id,
transaction_id,
customer_id,
store_id,
promotion_id,
quantity,
transaction_time,
total_amount,
category_id,
transaction_time,
current_time() as current_time
from all_transacts as a inner join datee as d on a.transaction_date = d.date
inner join prods as p on p.product_id=a.product_id