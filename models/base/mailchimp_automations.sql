{{ config(enabled=var('using_automations', True)) }}

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
        settings__from_name as from_name,
        settings__reply_to as reply_to,
        settings__title as title,
        settings__to_name as to_name,
        settings__authenticate as authenticate,
        settings__auto_footer as auto_footer,
        settings__inline_css as inline_css,
        settings__use_conversation as use_conversation,

        -- tracking
        tracking__clicktale as clicktale,
        tracking__google_analytics as google_analytics,
        tracking__ecomm360 as track_ecomm_360,
        tracking__goal_tracking as track_goals,
        tracking__html_clicks as track_html_clicks,
        tracking__opens as track_opens,
        tracking__text_clicks as track_text_clicks,

        -- recipients
        recipients__list_id as recipients_list_id,
        recipients__list_is_active as recipients_list_is_active,
        recipients__list_name as recipients__list_name,

        -- trigger
        trigger_settings__workflow_type as workflow_type,
        trigger_settings__runtime as runtime,
        trigger_settings__workflow_title as workflow_title,
        trigger_settings__workflow_emails_count as workflow_emails_count,

        -- report
        report_summary__opens as opens,
        report_summary__unique_opens as unique_opens,
        report_summary__open_rate as open_rate,
        report_summary__clicks as clicks,
        report_summary__subscriber_clicks as subscriber_clicks,
        report_summary__click_rate as click_rate

    from base

)
select *
from fields
