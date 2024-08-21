-- models/final/final_growth_analysis.sql
SELECT
    a.symbol,
    a.quarter,
    b.volume_price_correlation,
    c.avg_monthly_return,
    d.percentage_change,
    e.closing_above_open_percentage,
    f.avg_volatility
FROM {{ ref('quarterly_growth_rates') }} a
LEFT JOIN {{ ref('volume_price_correlation') }} b ON a.symbol = b.symbol
LEFT JOIN {{ ref('monthly_returns') }} c ON a.symbol = c.symbol
LEFT JOIN {{ ref('quarterly_percentage_change') }} d ON a.symbol = d.symbol
LEFT JOIN {{ ref('closing_above_open') }} e ON a.symbol = e.symbol
LEFT JOIN {{ ref('price_volatility') }} f ON a.symbol = f.symbol
