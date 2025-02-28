-- models/marts/rainfall_rolling_metrics.sql


select
    location_id,
    date,
    avg(total_daily_rainfall) over (
        partition by location_id
        order by date
        rows between 6 preceding and current row
    ) as seven_day_rolling_avg,
    sum(total_daily_rainfall) over (
        partition by location_id
        order by date
        rows between 29 preceding and current row
    ) as thirty_day_cumulative
from "dbtTest"."weather"."stg_daily_rainfall"