-- models/staging/stg_daily_rainfall.sql
{{ 
    config(
        materialized='table',
        schema='weather'
    ) 
}}

SELECT
    locationid,
    date,
    sum(rainfall_mm) as total_daily_rainfall,
    avg(rainfall_mm) as avg_hourly_rainfall,
    max(rainfall_mm) as peak_hourly_rainfall
FROM {{ source('dbo', 'RainFall') }}
GROUP BY locationid,date