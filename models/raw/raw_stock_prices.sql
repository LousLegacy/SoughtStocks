-- models/raw/raw_stock_prices.sql
SELECT
    date,
    symbol,
    close_price AS close_price,
    high_price AS high_price,
    low_price AS low_price,
    open_price AS open_price,
    volume
FROM {{ source('sp500_analysis', 'raw_stock_prices') }}
