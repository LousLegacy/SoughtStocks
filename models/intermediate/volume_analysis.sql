-- models/intermediate/volume_price_correlation.sql
SELECT
    symbol,
    CORR(close_price, volume) AS volume_price_correlation
FROM {{ ref('stg_stock_prices') }}
GROUP BY symbol
