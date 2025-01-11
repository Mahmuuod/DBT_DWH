{{ config(materialized="table") }}

with store as (select * from {{ ref("store") }})
select store_id, city, region, store_size
from store
