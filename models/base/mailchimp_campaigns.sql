with base as (

    select *
    from {{ var('campaign') }}

), fields as (

    select 
        id as campaign_id,
        web_id,
        create_time as create_timestamp,
        send_time as send_timestamp, 
        recipients__list_id as list_id,
        type as campaign_type,
        archive_url,
        content_type,
        long_archive_url,
        status,

        settings__title as title,
        settings__reply_to as reply_to_email,
        settings__authenticate as authenticate,
        settings__auto_footer as auto_footer,
        settings__auto_tweet as auto_tweet,
        settings__drag_and_drop as drag_and_drop,
        settings__fb_comments as fb_comments,
        settings__folder_id as folder_id,
        settings__from_name as from_name,
        settings__inline_css as inline_css,

        settings__subject_line as subject_line,
        settings__template_id as template_id,
        settings__timewarp as timewarp,
        settings__to_name as to_name,
        settings__preview_text as preview_text,
        settings__use_conversation as use_conversation,

        tracking__clicktale as clicktale,
        tracking__ecomm360 as track_ecomm_360,
        tracking__goal_tracking as track_goals,
        tracking__html_clicks as track_html_clicks,
        tracking__opens as track_opens,
        tracking__text_clicks as track_text_clicks,
        tracking__google_analytics as google_analytics,

        emails_sent,
        needs_block_refresh,
        resendable,

        recipients__list_is_active as list_is_active,
        recipients__list_name as list_name,
        recipients__segment_text as segment_text,
        recipients__recipient_count as recipient_count,
        recipients__segment_opts__saved_segment_id as segment_id,

        social_card__image_url as card_image_url,
        social_card__description as card_description,
        social_card__title as card_title,

        report_summary__opens as opens,
        report_summary__unique_opens as unique_opens,
        report_summary__open_rate as open_rate,
        report_summary__clicks as clicks,
        report_summary__subscriber_clicks as subscriber_clicks,
        report_summary__click_rate as click_rate,
        report_summary__ecommerce__total_orders as total_orders,
        report_summary__ecommerce__total_spent as total_spend,
        report_summary__ecommerce__total_revenue as total_revenue,
        delivery_status__enabled as delivery_status_enabled

    from base

)

select *
from fields
