{{ config(materialized='table') }}

with base as (

    select *
    from {{ var('segment')}}

), fields as (

    select
        id as segment_id,
        name as segment_name,
        type as segment_type,

        list_id,
        member_count,

        updated_at as updated_timestamp,
        created_at as created_timestamp,

        report_date,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY report_date DESC) AS rn
    from base

)

select *
from fields
where rn = 1
