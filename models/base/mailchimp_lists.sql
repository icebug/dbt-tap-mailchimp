{{ config(materialized='table') }}

with base as (

    select *
    from {{ var('list') }}

), fields as (

    select 
        id as list_id,
        web_id,
        date_created,
        name,
        list_rating,
        beamer_address,

        contact.address1 as address_1,
        contact.address2 as address_2,
        contact.city as city,
        contact.company as company,
        contact.country as country,
        contact.state as state,
        contact.zip as zip,
        contact.phone as phone,

        campaign_defaults.from_email as default_from_email,
        campaign_defaults.from_name as default_from_name,
        campaign_defaults.language as default_language,
        campaign_defaults.subject as default_subject,
        double_optin,
        has_welcome,
        email_type_option,
        notify_on_subscribe,
        notify_on_unsubscribe,
        permission_reminder,
        marketing_permissions,
        subscribe_url_long,
        subscribe_url_short,
        use_archive_bar,
        visibility,

        stats.member_count as member_count,
        stats.unsubscribe_count as unsubscribe_count,
        stats.cleaned_count as cleaned_count,
        stats.member_count_since_send as member_count_since_send,
        stats.unsubscribe_count_since_send as unsubscribe_count_since_send,
        stats.cleaned_count_since_send as cleaned_count_since_send,
        stats.campaign_count as campaign_count,
        stats.campaign_last_sent as campaign_last_sent,
        stats.merge_field_count as merge_field_count,
        stats.avg_sub_rate as avg_subscribe_rate,
        stats.avg_unsub_rate as avg_unsubscribe_rate,
        stats.target_sub_rate as target_subscribe_rate,
        stats.open_rate as open_rate,
        stats.click_rate as click_rate,
        stats.last_sub_date as last_subscribe_date,
        stats.last_unsub_date as last_unsubscribe_date

    from base

)

select *
from fields

