

select
    cast(locationid as varchar(6)) as location_id,
    cast(locationame as varchar(50)) as location_name
from "dbtTest"."weather"."raw_station_locations"  
where locationid is not null