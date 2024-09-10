WITH ma_data AS (
   
    SELECT
        TICKER,
        DATE,
        ma_30,
        ma_90
    FROM {{ ref('int_moving_averages') }}
),
long_term_growth_data AS (

    SELECT
        TICKER,
        long_term_growth
    FROM {{ ref('int_long_term_growth') }}
),
quarterly_growth_data AS (
    
    SELECT
        TICKER,
        quarter,
        quarterly_growth
    FROM {{ ref('int_quarterly_growth') }}
)

SELECT
    ma_data.TICKER,
    ma_data.DATE,
    ma_data.ma_30,
    ma_data.ma_90,
    long_term_growth_data.long_term_growth,
    quarterly_growth_data.quarter,
    quarterly_growth_data.quarterly_growth
FROM ma_data
LEFT JOIN long_term_growth_data
    ON ma_data.TICKER = long_term_growth_data.TICKER
LEFT JOIN quarterly_growth_data
    ON ma_data.TICKER = quarterly_growth_data.TICKER
--j