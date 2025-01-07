{{config(materialized='table')}}

with customer as
(
select *
from {{ref('stg_staging__Customer')}}

)
select customer_id,first_name,last_name,gender,age,city,loyalty_status
from customer