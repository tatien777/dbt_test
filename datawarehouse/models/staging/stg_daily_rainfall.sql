-- models/staging/stg_daily_rainfall.sql
{{
    config(materialized='table')
}}

select
    location_id,
    date_trunc('day', observation_time) as date,
    sum(rainfall_mm) as total_daily_rainfall,
    avg(rainfall_mm) as avg_hourly_rainfall,
    max(rainfall_mm) as peak_hourly_rainfall
from test
group by 1, 2