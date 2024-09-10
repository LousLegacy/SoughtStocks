WITH stock_data AS (
    SELECT
        TICKER,
        DATE_TRUNC('month', DATE) AS month,
        FIRST_VALUE(CLOSE) OVER (PARTITION BY TICKER, DATE_TRUNC('month', DATE) ORDER BY DATE) AS first_close,
        LAST_VALUE(CLOSE) OVER (PARTITION BY TICKER, DATE_TRUNC('month', DATE) ORDER BY DATE) AS last_close
    FROM {{ ref('stg_stock_prices') }}
)

SELECT
    TICKER,
    month,
    (last_close - first_close) / first_close AS monthly_return
FROM stock_data
WHERE first_close IS NOT NULL AND last_close IS NOT NULL
