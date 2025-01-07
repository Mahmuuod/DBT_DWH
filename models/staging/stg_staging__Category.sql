with 

source as (

    select * from {{ source('staging', 'Category') }}

),

categoryData as (

    select
        category_id,
        category_name

    from source

)

select * from categoryData
