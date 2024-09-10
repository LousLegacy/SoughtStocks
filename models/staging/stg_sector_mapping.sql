WITH sector_mapping AS (
    SELECT 'AMZN' AS TICKER, 'Consumer Discretionary' AS SECTOR
    UNION  
    SELECT 'CVX' AS TICKER, 'Energy' AS SECTOR
    UNION
    SELECT 'GOOGL' AS TICKER, 'Communication Services' AS SECTOR
    UNION
    SELECT 'GS' AS TICKER, 'Financials' AS SECTOR
    UNION
    SELECT 'JPM' AS TICKER, 'Financials' AS SECTOR
    UNION
    SELECT 'KO' AS TICKER, 'Consumer Staples' AS SECTOR
    UNION
    SELECT 'META' AS TICKER, 'Communication Services' AS SECTOR
    UNION
    SELECT 'MRNA' AS TICKER, 'Health Care' AS SECTOR
    UNION
    SELECT 'MSFT' AS TICKER, 'Information Technology' AS SECTOR
    UNION
    SELECT 'NVDA' AS TICKER, 'Information Technology' AS SECTOR
    UNION
    SELECT 'PFE' AS TICKER, 'Health Care' AS SECTOR
    UNION
    SELECT 'PG' AS TICKER, 'Consumer Staples' AS SECTOR
    UNION
    SELECT 'TSLA' AS TICKER, 'Consumer Discretionary' AS SECTOR
    UNION
    SELECT 'XOM' AS TICKER, 'Energy' AS SECTOR
)

SELECT *
FROM sector_mapping
