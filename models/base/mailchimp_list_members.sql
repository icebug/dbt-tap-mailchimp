{{ config(enabled=var('using_segments', True)) }}

with base as (

    select *
    from {{ var('list_member')}}

), fields as (

    select
        id as member_id,
        web_id,
        email_address,
        unique_email_id,
        email_type,
        list_id,
        status,
        unsubscribe_reason,

        stats__avg_open_rate as avg_open_rate,
        stats__avg_click_rate as avg_click_rate,

        ip_signup,
        timestamp_signup,
        ip_opt,
        timestamp_opt,
        member_rating,
        last_changed,
        language,
        vip,
        email_client,

        location__latitude as latitude,
        location__longitude as longitude,
        location__gmtoff as gmtoff,
        location__dstoff as dstoff,
        location__country_code as country_code,
        location__timezone as timezone

    from base

), unique_key as (

    select
        *,
        {{ dbt_utils.surrogate_key(['unique_email_id', 'member_id', 'list_id']) }} as id
    from fields
)

select *
from unique_key

