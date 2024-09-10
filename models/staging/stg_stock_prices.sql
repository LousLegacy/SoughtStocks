WITH stock_data AS (
    SELECT
        _ROW AS row_id,
        TICKER,
        DATE,
        OPEN,
        HIGH,
        LOW,
        CLOSE,
        ADJ_CLOSE,
        VOLUME
    FROM {{ source('stock_data', 'stock_table') }}
)

SELECT *
FROM stock_data
