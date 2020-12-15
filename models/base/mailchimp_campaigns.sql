with base as (

    select *
    from {{ var('campaign') }}

), fields as (

    select 
        id as campaign_id,
        web_id,
        create_time as create_timestamp,
        send_time as send_timestamp, 
        recipients.list_id as list_id,
        type as campaign_type,
        archive_url,
        content_type,
        long_archive_url,
        status,

        settings.title as title,
        settings.reply_to as reply_to_email,
        settings.authenticate as authenticate,
        settings.auto_footer as auto_footer,
        settings.auto_tweet as auto_tweet,
        settings.drag_and_drop as drag_and_drop,
        settings.fb_comments as fb_comments,
        settings.folder_id as folder_id,
        settings.from_name as from_name,
        settings.inline_css as inline_css,

        settings.subject_line as subject_line,
        settings.template_id as template_id,
        settings.timewarp as timewarp,
        settings.to_name as to_name,
        settings.preview_text as preview_text,
        settings.use_conversation as use_conversation,

        tracking.clicktale as clicktale,
        tracking.ecomm360 as track_ecomm_360,
        tracking.goal_tracking as track_goals,
        tracking.html_clicks as track_html_clicks,
        tracking.opens as track_opens,
        tracking.text_clicks as track_text_clicks,
        tracking.google_analytics as google_analytics,

        emails_sent,
        needs_block_refresh,
        resendable,

        recipients.list_is_active as list_is_active,
        recipients.list_name as list_name,
        recipients.segment_text as segment_text,
        recipients.recipient_count as recipient_count,
        recipients.segment_opts.saved_segment_id as segment_id,

        social_card.image_url as card_image_url,
        social_card.description as card_description,
        social_card.title as card_title,

        report_summary.opens as opens,
        report_summary.unique_opens as unique_opens,
        report_summary.open_rate as open_rate,
        report_summary.clicks as clicks,
        report_summary.subscriber_clicks as subscriber_clicks,
        report_summary.click_rate as click_rate,
        report_summary.ecommerce.total_orders as total_orders,
        report_summary.ecommerce.total_spent as total_spend,
        report_summary.ecommerce.total_revenue as total_revenue,
        delivery_status.enabled as delivery_status_enabled

    from base

)

select *
from fields
