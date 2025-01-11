with cte as (select * from {{ source("staging", "store") }}) select * from cte
