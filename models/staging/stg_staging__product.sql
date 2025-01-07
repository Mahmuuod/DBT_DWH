with 

source as (

    select * from {{ source('staging', 'product') }}

),

productData as (

    select
        product_id,
        product_name,
        product_type,
        product_description,
        price,
        cost,
        unit_measure,
        brand_name,
        category_id,
        subcategory_id

    from source

)

select * from productData
