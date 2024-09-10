WITH stock_data AS (
    SELECT
        TICKER,
        VOLUME,
        CLOSE
    FROM {{ ref('stg_stock_prices') }}
)

SELECT
    TICKER,
    CORR(VOLUME, CLOSE) AS volume_price_corr
FROM stock_data
GROUP BY TICKER
