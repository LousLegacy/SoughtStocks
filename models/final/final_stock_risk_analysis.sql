WITH price_volatility AS (
    SELECT
        TICKER,
        DATE,
        price_volatility
    FROM {{ ref('int_price_volatility') }}
),

volume_price_corr AS (
    SELECT
        TICKER,
        volume_price_corr
    FROM {{ ref('int_volume_price_corr') }}
)

SELECT
    pv.TICKER,
    pv.DATE,
    pv.price_volatility,
    vpc.volume_price_corr
FROM price_volatility pv
LEFT JOIN volume_price_corr vpc
    ON pv.TICKER = vpc.TICKER
