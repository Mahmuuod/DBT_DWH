with 

source as (

    select * from {{ source('staging', 'promotion') }}

)

select * from source
