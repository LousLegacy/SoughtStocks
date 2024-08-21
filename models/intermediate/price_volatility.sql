-- models/intermediate/price_volatility.sql
SELECT
    symbol,
    AVG(high_price - low_price) AS avg_volatility
FROM {{ ref('stg_stock_prices') }}
GROUP BY symbol
