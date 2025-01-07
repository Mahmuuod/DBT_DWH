with 

source as (

    select * from {{ source('staging', 'promotion') }}

),

promotionData as (

    select
        promotion_id,
        promotion_name,
        promotion_type,
        discount_percentage

    from source

)

select * from promotionData
