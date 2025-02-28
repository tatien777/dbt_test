
  
    USE [dbtTest];
    USE [dbtTest];
    
    

    

    
    USE [dbtTest];
    EXEC('
        create view "weather"."stg_daily_rainfall__dbt_tmp__dbt_tmp_vw" as -- models/staging/stg_daily_rainfall.sql


SELECT
    locationid,
    date,
    sum(rainfall_mm) as total_daily_rainfall,
    avg(rainfall_mm) as avg_hourly_rainfall,
    max(rainfall_mm) as peak_hourly_rainfall
FROM "dbtTest"."dbo"."RainFall"
GROUP BY locationid,date;
    ')

EXEC('
            SELECT * INTO "dbtTest"."weather"."stg_daily_rainfall__dbt_tmp" FROM "dbtTest"."weather"."stg_daily_rainfall__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS weather.stg_daily_rainfall__dbt_tmp__dbt_tmp_vw')



    
    use [dbtTest];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'weather_stg_daily_rainfall__dbt_tmp_cci'
        AND object_id=object_id('weather_stg_daily_rainfall__dbt_tmp')
    )
    DROP index "weather"."stg_daily_rainfall__dbt_tmp".weather_stg_daily_rainfall__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX weather_stg_daily_rainfall__dbt_tmp_cci
    ON "weather"."stg_daily_rainfall__dbt_tmp"

   


  