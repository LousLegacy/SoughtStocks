WITH stock_data AS (
    SELECT
        TICKER,
        DATE,
        CLOSE,
        LAG(CLOSE) OVER (PARTITION BY TICKER ORDER BY DATE) AS previous_close
    FROM {{ ref('stg_stock_prices') }}
)

SELECT
    TICKER,
    DATE,
    (CLOSE - previous_close) / previous_close AS daily_return
FROM stock_data
WHERE previous_close IS NOT NULL
