{{ config(materialized="table") }}

with promotions as (select * from {{ ref("stg_staging__promotion") }})
select
    cast(promotion_id as int) as promotion_id,
    promotion_name,
    promotion_type,
    discount_percentage
from promotions
