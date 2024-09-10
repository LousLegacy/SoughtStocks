WITH stock_data AS (
    SELECT
        s.TICKER,
        s.DATE,
        s.CLOSE,
        s.VOLUME,
        m.SECTOR
    FROM {{ ref('stg_stock_prices') }} s
    LEFT JOIN {{ ref('stg_sector_mapping') }} m ON s.TICKER = m.TICKER
)

SELECT
    SECTOR,
    AVG(CLOSE) AS avg_close_price,
    AVG(VOLUME) AS avg_volume
FROM stock_data
GROUP BY SECTOR
