with 

source as (

    select * from {{ source('staging', 'DateDIM') }}

),

Datedata as (

    select
        datekey,
        full_date,
        daynumber,
        dayname,
        monthname,
        yearno,
        season,
        quarter

    from source

)
select * from Datedata
