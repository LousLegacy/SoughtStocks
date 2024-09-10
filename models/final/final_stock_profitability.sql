WITH monthly_returns AS (
    SELECT
        TICKER,
        month,
        monthly_return
    FROM {{ ref('int_monthly_returns') }}
),

profitability_analysis AS (
    SELECT
        TICKER,
        avg_profit,
        avg_volume
    FROM {{ ref('int_profitability_analysis') }}
)


SELECT
    mr.TICKER,
    mr.month,
    mr.monthly_return,
    pa.avg_profit,
    pa.avg_volume
FROM monthly_returns mr
LEFT JOIN profitability_analysis pa
    ON mr.TICKER = pa.TICKER
