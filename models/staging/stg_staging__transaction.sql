with
    source as (
        select
            transaction_id,
            customer_id,
            store_id,
            promotion_id,
            transaction_date,
            transaction_time,
            total_amount
        from {{ source("staging", "transaction") }}
    )

select
    transaction_id,
    customer_id,
    store_id,
    coalesce(safe_cast(promotion_id as int), 0) as promotion_id,
    transaction_date,
    transaction_time,
    total_amount
from source
