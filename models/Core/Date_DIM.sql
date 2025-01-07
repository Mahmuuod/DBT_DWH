{{config(materialized='table')}}

with DateData as
(
    select *
    from {{ref("stg_staging__DateDIM")}}

)
select datekey,full_date as date,daynumber as day,
monthname as month,quarter,yearno as year,
dayname as DayOfWeek , season
from DateData