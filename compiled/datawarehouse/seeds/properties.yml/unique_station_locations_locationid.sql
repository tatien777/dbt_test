
    
    

select
    locationid as unique_field,
    count(*) as n_records

from "dbtTest"."weather"."raw_station_locations"
where locationid is not null
group by locationid
having count(*) > 1


