WITH stock_data AS (
    SELECT
        TICKER,
        DATE,
        (CLOSE - OPEN) AS profit,
        VOLUME
    FROM {{ ref('stg_stock_prices') }}
)

SELECT
    TICKER,
    AVG(profit) AS avg_profit,
    AVG(VOLUME) AS avg_volume
FROM stock_data
GROUP BY TICKER
