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

        contact__address1 as address_1,
        contact__address2 as address_2,
        contact__city as city,
        contact__company as company,
        contact__country as country,
        contact__state as state,
        contact__zip as zip,
        contact__phone as phone,

        campaign_defaults__from_email as default_from_email,
        campaign_defaults__from_name as default_from_name,
        campaign_defaults__language as default_language,
        campaign_defaults__subject as default_subject,
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

        stats__member_count as member_count,
        stats__unsubscribe_count as unsubscribe_count,
        stats__cleaned_count as cleaned_count,
        stats__member_count_since_send as member_count_since_send,
        stats__unsubscribe_count_since_send as unsubscribe_count_since_send,
        stats__cleaned_count_since_send as cleaned_count_since_send,
        stats__campaign_count as campaign_count,
        stats__campaign_last_sent as campaign_last_sent,
        stats__merge_field_count as merge_field_count,
        stats__avg_sub_rate as avg_subscribe_rate,
        stats__avg_unsub_rate as avg_unsubscribe_rate,
        stats__target_sub_rate as target_subscribe_rate,
        stats__open_rate as open_rate,
        stats__click_rate as click_rate,
        stats__last_sub_date as last_subscribe_date,
        stats__last_unsub_date as last_unsubscribe_date

    from base

)

select *
from fields

