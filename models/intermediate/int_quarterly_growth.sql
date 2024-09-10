WITH stock_data AS (
    SELECT
        TICKER,
        DATE_TRUNC('quarter', DATE) AS quarter,
        LAST_VALUE(CLOSE) OVER (PARTITION BY TICKER, DATE_TRUNC('quarter', DATE) ORDER BY DATE) AS last_close,
        FIRST_VALUE(CLOSE) OVER (PARTITION BY TICKER, DATE_TRUNC('quarter', DATE) ORDER BY DATE) AS first_close
    FROM {{ ref('stg_stock_prices') }}
)

SELECT
    TICKER,
    quarter,
    (last_close - first_close) / first_close AS quarterly_growth
FROM stock_data
WHERE first_close IS NOT NULL AND last_close IS NOT NULL
