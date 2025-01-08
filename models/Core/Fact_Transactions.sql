{{config(materialized='table')}}

with trans as(
    select * from {{ref('stg_staging__transaction')}}
),
prod_trans as
(
    select * from {{ref('stg_staging__product_transaction')}}
),
datee as
(
    select * from {{ref('stg_staging__DateDIM')}}
),
prods as
(
    select * from {{ref('stg_staging__product')}}
),
all_transacts as
(
    select trans.transaction_id,quantity,customer_id,store_id,promotion_id,transaction_time,total_amount,transaction_date,product_id
    from trans inner join prod_trans on trans.transaction_id=prod_trans.transaction_id
),
fact as (
select row_number() over() as id,
datekey,
transaction_id,
customer_id,
store_id,
promotion_id,
category_id,
p.product_id,
transaction_time,
current_timestamp() as current_time,
quantity,
total_amount
from all_transacts as a inner join datee as d on a.transaction_date = d.full_date
inner join prods as p on p.product_id=a.product_id
)
select * from fact order by id