{{ config(enabled=var('using_automations', True)) }}
{{ config(materialized='table') }}

with base as (

    select *
    from {{ var('automation')}}

), fields as (

    select
        -- IDs and standard timestamp
        id as automation_email_id,
        create_time as created_timestamp,
        start_time as started_timestamp,

        -- email details
        status,
        emails_sent,
        settings.from_name as from_name,
        settings.reply_to as reply_to,
        settings.title as title,
        settings.to_name as to_name,
        settings.authenticate as authenticate,
        settings.auto_footer as auto_footer,
        settings.inline_css as inline_css,
        settings.use_conversation as use_conversation,

        -- tracking
        tracking.clicktale as clicktale,
        tracking.google_analytics as google_analytics,
        tracking.ecomm360 as track_ecomm_360,
        tracking.goal_tracking as track_goals,
        tracking.html_clicks as track_html_clicks,
        tracking.opens as track_opens,
        tracking.text_clicks as track_text_clicks,

        -- recipients
        recipients.list_id as recipients_list_id,
        recipients.list_is_active as recipients_list_is_active,
        recipients.list_name as recipients__list_name,

        -- trigger
        trigger_settings.workflow_type as workflow_type,
        trigger_settings.runtime as runtime,
        trigger_settings.workflow_title as workflow_title,
        trigger_settings.workflow_emails_count as workflow_emails_count,

        -- report
        report_summary.opens as opens,
        report_summary.unique_opens as unique_opens,
        report_summary.open_rate as open_rate,
        report_summary.clicks as clicks,
        report_summary.subscriber_clicks as subscriber_clicks,
        report_summary.click_rate as click_rate

    from base

)
select *
from fields
