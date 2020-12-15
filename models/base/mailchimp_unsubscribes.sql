with base as (

    select *
    from {{ var('unsubscribe') }}

), fields as (

    select 
        campaign_id,
        list_id,
        reason as unsubscribe_reason,
        timestamp as unsubscribe_timestamp,
        email_id,
        email_address,
        vip,
        list_is_active

    from base

), unique_key as (

    select 
        *, 
        {{ dbt_utils.surrogate_key([ 'email_id', 'list_id', 'unsubscribe_timestamp']) }} as id
    from fields

)

select *
from unique_key