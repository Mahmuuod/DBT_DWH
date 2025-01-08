{{config(materialized='table')}}

with category as
(
    select * from
    {{ref('stg_staging__Category')}}
),
subcat as
(
    select * from
    {{ref('stg_staging__subcategory')}} 
    
),
dim as (
    select row_number() over() as Surrogate_key,
    category.category_id,category_name,subcategory_name
    from
    category inner join subcat on category.category_id=subcat.category_id
)
select * from dim order by Surrogate_key

