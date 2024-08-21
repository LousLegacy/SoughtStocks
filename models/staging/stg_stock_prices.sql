-- models/staging/stg_stock_prices.sql
WITH cleaned_data AS (
    SELECT
        date,
        symbol,
        TRY_CAST(close_price AS FLOAT) AS close_price,
        TRY_CAST(high_price AS FLOAT) AS high_price,
        TRY_CAST(low_price AS FLOAT) AS low_price,
        TRY_CAST(open_price AS FLOAT) AS open_price,
        TRY_CAST(volume AS FLOAT) AS volume
    FROM {{ ref('raw_stock_prices') }}
)
SELECT *
FROM cleaned_data
WHERE date IS NOT NULL
AND symbol IS NOT NULL
