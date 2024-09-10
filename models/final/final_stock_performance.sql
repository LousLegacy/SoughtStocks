WITH daily_returns AS (
    SELECT
        TICKER,
        DATE,
        daily_return
    FROM {{ ref('int_daily_returns') }}
),

price_volatility AS (
    SELECT
        TICKER,
        DATE,
        price_volatility
    FROM {{ ref('int_price_volatility') }}
),

moving_averages AS (
    SELECT
        TICKER,
        DATE,
        ma_30,
        ma_90
    FROM {{ ref('int_moving_averages') }}
),

price_momentum AS (
    SELECT
        TICKER,
        DATE,
        momentum_5_days,
        momentum_20_days
    FROM {{ ref('int_price_momentum') }}
)


SELECT
    dr.TICKER,
    dr.DATE,
    dr.daily_return,
    pv.price_volatility,
    ma.ma_30,
    ma.ma_90,
    pm.momentum_5_days,
    pm.momentum_20_days
FROM daily_returns dr
LEFT JOIN price_volatility pv
    ON dr.TICKER = pv.TICKER
    AND dr.DATE = pv.DATE
LEFT JOIN moving_averages ma
    ON dr.TICKER = ma.TICKER
    AND dr.DATE = ma.DATE
LEFT JOIN price_momentum pm
    ON dr.TICKER = pm.TICKER
    AND dr.DATE = pm.DATE
