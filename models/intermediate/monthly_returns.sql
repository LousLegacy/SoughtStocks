-- models/intermediate/monthly_returns.sql
WITH monthly_data AS (
    SELECT
        symbol,
        DATE_TRUNC('month', date) AS month,
        (LAST_VALUE(close_price) OVER (PARTITION BY symbol, DATE_TRUNC('month', date) ORDER BY date) - 
         FIRST_VALUE(close_price) OVER (PARTITION BY symbol, DATE_TRUNC('month', date) ORDER BY date)) /
        NULLIF(FIRST_VALUE(close_price) OVER (PARTITION BY symbol, DATE_TRUNC('month', date) ORDER BY date), 0) AS monthly_return
    FROM {{ ref('stg_stock_prices') }}
)
SELECT
    symbol,
    month,
    AVG(monthly_return) AS avg_monthly_return
FROM monthly_data
GROUP BY symbol, month
