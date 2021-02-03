{{ config(materialized='table') }}

with base as (

    select *
    from {{ var('email_activity') }}

), fields as (

    select
        campaign_id,
        list_id,
        list_is_active,
        email_id,
        email_address,
        action,
        type,
        timestamp,
        ip,
        url,
        report_date

    from base

)

select *
from fields

