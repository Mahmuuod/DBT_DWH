{{ config(materialized="table") }}

with customer as (select * from {{ ref("stg_staging__Customer") }})
select
    customer_id,
    concat(first_name, last_name) as full_name,
    age,
    city,
    loyalty_status,
    case
        when gender like 'm%' or gender like 'M%'
        then 'Male'
        when gender like 'f%' or gender like 'F%'
        then 'Female'
        else 'Unknown'
    end as gender
from customer
