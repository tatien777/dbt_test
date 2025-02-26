{{
    config(
        materialized='table',
        alias='stationlocations'
    )
}}

select
    cast(locationid as varchar(6)) as location_id,
    cast(locationname as varchar(50)) as location_name
from test 
where locationid is not null
