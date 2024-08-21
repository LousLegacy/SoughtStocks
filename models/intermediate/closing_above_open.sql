-- models/intermediate/closing_above_open.sql
SELECT
    symbol,
    COUNT(*) FILTER (WHERE close_price > open_price) / COUNT(*)::FLOAT AS closing_above_open_percentage
FROM {{ ref('stg_stock_prices') }}
GROUP BY symbol
