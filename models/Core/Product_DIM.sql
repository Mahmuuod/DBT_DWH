{{config(materialized='table')}}

with prod as
(
    select product_id,product_name,product_type,
    price,cost,unit_measure,brand_name
    from {{ref('stg_staging__product')}} 

)
select * from prod