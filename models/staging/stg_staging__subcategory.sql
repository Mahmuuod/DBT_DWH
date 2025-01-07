with 

source as (

    select * from {{ source('staging', 'subcategory') }}

),

subcatData as (

    select
        subcategory_id,
        subcategory_name,
        category_id

    from source

)

select * from subcatData
