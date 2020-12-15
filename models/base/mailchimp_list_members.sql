{{ config(enabled=var('using_segments', True)) }}
{{ config(materialized='table') }}

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

        stats.avg_open_rate as avg_open_rate,
        stats.avg_click_rate as avg_click_rate,

        ip_signup,
        timestamp_signup,
        ip_opt,
        timestamp_opt,
        member_rating,
        last_changed,
        language,
        vip,
        email_client,

        location.latitude as latitude,
        location.longitude as longitude,
        location.gmtoff as gmtoff,
        location.dstoff as dstoff,
        location.country_code as country_code,
        location.timezone as timezone

    from base

), unique_key as (

    select
        *,
        {{ dbt_utils.surrogate_key(['unique_email_id', 'member_id', 'list_id']) }} as id
    from fields
)

select *
from unique_key

