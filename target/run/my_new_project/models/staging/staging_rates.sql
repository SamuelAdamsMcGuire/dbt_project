
  
    

  create  table "exchange_rates"."public"."staging_rates__dbt_tmp"
  as (
    WITH extracted_rates AS (
    SELECT ((extracted_data -> 'date')::VARCHAR)::DATE AS timestamp,
           (extracted_data -> 'base')::VARCHAR  AS base_currency,
           ((extracted_data -> 'rates' -> 'GBP')::VARCHAR)::FLOAT  AS gbp,
           ((extracted_data -> 'rates' -> 'KES')::VARCHAR)::FLOAT  AS kes,
           ((extracted_data -> 'rates' -> 'HRK')::VARCHAR)::FLOAT  AS hrk
    FROM "exchange_rates"."public"."raw_rates"
)
SELECT *
FROM extracted_rates
  );
  