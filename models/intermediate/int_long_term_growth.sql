WITH stock_data AS (
    SELECT
        TICKER,
        DATE,
        CLOSE,
        FIRST_VALUE(CLOSE) OVER (PARTITION BY TICKER ORDER BY DATE ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS first_close,
        LAST_VALUE(CLOSE) OVER (PARTITION BY TICKER ORDER BY DATE ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_close
    FROM {{ ref('stg_stock_prices') }}
)

SELECT
    TICKER,
    (last_close - first_close) / first_close AS long_term_growth
FROM stock_data
GROUP BY TICKER, first_close, last_close
