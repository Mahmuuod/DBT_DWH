{{config(materialized='table')}}

with category as
(
    select * from
    {{ref('stg_staging__Category')}}
)
subcat as
(
    select * from
    {{ref('stg_staging__subcategory')}} 
    
)
    select category_id,category_name,subcategory_name
    category inner join subcat on category.category_id=subcat.category_id