
  
    

  create  table "exchange_rates"."public"."prep_rates__dbt_tmp"
  as (
    WITH rates_extracted AS (
    SELECT *
    FROM "exchange_rates"."public"."staging_rates"
),
add_weekday AS (
    SELECT *,
           to_char(timestamp, 'Day') AS weekday
    FROM rates_extracted
)
SELECT *
FROM add_weekday
ORDER BY timestamp
  );
  