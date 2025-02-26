-- models/marts/regional_rainfall.sql
{{
    config(materialized='table')
}}

with locations as (
    select * from {{ ref('dim_locations') }}
)

select
    r.date,
    l.region,
    l.elevation_bucket,
    sum(r.total_daily_rainfall) as regional_total,
    rank() over (partition by l.region order by sum(r.total_daily_rainfall) desc) as rainfall_rank
from {{ ref('stg_daily_rainfall') }} r
join locations l
on r.location_id = l.location_id
group by 1,2,3
