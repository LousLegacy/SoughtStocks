WITH stock_data AS (
    SELECT
        TICKER,
        DATE,
        HIGH,
        LOW
    FROM {{ ref('stg_stock_prices') }}
)

SELECT
    TICKER,
    DATE,
    (HIGH - LOW) AS price_volatility
FROM stock_data
