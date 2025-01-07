with 

source as (

    select * from {{ source('staging', 'Customer') }}

),

cte as (

    select
        customer_id,
        first_name,
        last_name,
        gender,
        age,
        city,
        loyalty_status

    from source

)
select * from cte
