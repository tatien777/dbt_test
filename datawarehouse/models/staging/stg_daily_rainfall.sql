-- models/staging/stg_daily_rainfall.sql
{{
    config(materialized='table')
}}

select * from datawarehouse_staging