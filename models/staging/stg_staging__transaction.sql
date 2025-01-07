with 

source as (

    select * from {{ source('staging', 'transaction') }}

),

TransData as (

    select
        transaction_id,
        customer_id,
        store_id,
        promotion_id,
        transaction_date,
        transaction_time,
        total_amount

    from source

)

select * from TransData
