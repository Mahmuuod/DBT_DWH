with

    source as (select * from {{ source("staging", "subcategory") }}),

    subcatdata as (select subcategory_id, subcategory_name, category_id from source)

select *
from subcatdata
