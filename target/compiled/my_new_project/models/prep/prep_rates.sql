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