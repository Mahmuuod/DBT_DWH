with 

source as (

    select * from {{ source('staging', 'product_transaction') }}

),

productTransData as (

    select
        transaction_id,
        product_id,
        quantity,
        price_at_transaction

    from source

)

select * from productTransData
