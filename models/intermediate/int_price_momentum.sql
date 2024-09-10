WITH stock_data AS (
    SELECT
        TICKER,
        DATE,
        CLOSE
    FROM {{ ref('stg_stock_prices') }}
)

SELECT
    TICKER,
    DATE,
    (CLOSE - LAG(CLOSE, 5) OVER (PARTITION BY TICKER ORDER BY DATE)) AS momentum_5_days,
    (CLOSE - LAG(CLOSE, 20) OVER (PARTITION BY TICKER ORDER BY DATE)) AS momentum_20_days
FROM stock_data
