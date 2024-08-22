-- models/intermediate/quarterly_growth_rates.sql
WITH base_data AS (
    SELECT
        symbol,
        DATE_TRUNC('quarter', date) AS quarter,
        FIRST_VALUE(close_price) OVER (PARTITION BY symbol, DATE_TRUNC('quarter', date) ORDER BY date) AS start_price,
        LAST_VALUE(close_price) OVER (PARTITION BY symbol, DATE_TRUNC('quarter', date) ORDER BY date) AS end_price
    FROM {{ ref('stg_stock_prices') }}
)
SELECT
    symbol,
    quarter,
    (end_price - start_price) / NULLIF(start_price, 0) AS growth_rate
FROM base_data
