-- models/marts/rainfall_anomalies.sql
{{
    config(materialized='table')
}}

with historical_avg as (
    select
        location_id,
        avg(total_daily_rainfall) as historical_avg,
        stddev(total_daily_rainfall) as historical_std
    from {{ ref('stg_daily_rainfall') }}
    where date < current_date - interval '1 year'
    group by 1
)

select
    d.location_id,
    d.date,
    d.total_daily_rainfall,
    (d.total_daily_rainfall - h.historical_avg) / h.historical_std as z_score
from {{ ref('stg_daily_rainfall') }} d
join historical_avg h
on d.location_id = h.location_id
where d.date >= current_date - interval '1 year'
