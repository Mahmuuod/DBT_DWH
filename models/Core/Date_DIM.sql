{{ config(materialized="table") }}

with datedata as (select * from {{ ref("stg_staging__DateDIM") }})
select
    datekey,
    full_date as date,
    daynumber as day,
    monthname as month,
    quarter,
    yearno as year,
    dayname as dayofweek,
    season
from datedata
