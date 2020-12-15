{{ config(enabled=var('using_segments', True)) }}

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
        created_at as created_timestamp
    from base

)

select *
from fields

