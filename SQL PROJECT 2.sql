SELECT * FROM`gaza_prices_clean.csv`;

SELECT 
    commodity_name_en,
    unit_en,
    price_before_war,
    price_after_war,
    ROUND(((price_after_war - price_before_war) / price_before_war) * 100, 2) AS shock_change_pct
FROM `gaza_prices_clean.csv`
ORDER BY shock_change_pct DESC;


SELECT 
    commodity_name_en,
    unit_en,
    price_before_war,
    GREATEST(
        price_after_war, `price nov _2023`, `price dec_2023`, `price jan_2024`,
        `price feb_2024`, `price mar_2024`, `price apr_2024`, `price may_2024`,
        `price jun_2024`, `price july_2024`, `price aug_2024`, `price sep_2024`,
        `price oct_2024`, `price nov_2024`, `price dec_2024`
    ) AS peak_price
FROM `gaza_prices_clean.csv`
ORDER BY peak_price DESC;


SELECT 
    commodity_name_en,
    unit_en,
    price_before_war,
    CAST(REPLACE(cumulative_change_pct, '%', '') AS DECIMAL(10,2)) AS cumulative_change_num
FROM `gaza_prices_clean.csv`
ORDER BY cumulative_change_num DESC
LIMIT 15;


SELECT 
    commodity_name_en,
    CASE 
        WHEN commodity_name_en LIKE '%water%' THEN 'Water'
        WHEN commodity_name_en LIKE '%rice%' OR commodity_name_en LIKE '%flour%' 
             OR commodity_name_en LIKE '%bread%' THEN 'Staple Food'
        WHEN commodity_name_en LIKE '%gasoline%' OR commodity_name_en LIKE '%diesel%' 
             OR commodity_name_en LIKE '%Gas Cylinder%' THEN 'Fuel'
        WHEN commodity_name_en LIKE '%cigarette%' THEN 'Non-Essential'
        ELSE 'Other Food'
    END AS category,
    price_before_war,
    price_after_war,
    CAST(REPLACE(cumulative_change_pct, '%', '') AS DECIMAL(10,2)) AS cumulative_change_num
FROM `gaza_prices_clean.csv`
ORDER BY category, cumulative_change_num DESC;


SELECT 
    CASE 
        WHEN commodity_name_en LIKE '%water%' THEN 'Water'
        WHEN commodity_name_en LIKE '%rice%' OR commodity_name_en LIKE '%flour%' 
             OR commodity_name_en LIKE '%bread%' THEN 'Staple Food'
        WHEN commodity_name_en LIKE '%gasoline%' OR commodity_name_en LIKE '%diesel%' 
             OR commodity_name_en LIKE '%Gas Cylinder%' THEN 'Fuel'
        WHEN commodity_name_en LIKE '%cigarette%' THEN 'Non-Essential'
        ELSE 'Other Food'
    END AS category,
    COUNT(*) AS item_count,
    ROUND(AVG(CAST(REPLACE(cumulative_change_pct, '%', '') AS DECIMAL(10,2))), 2) AS avg_cumulative_change
FROM `gaza_prices_clean.csv`
GROUP BY category
ORDER BY avg_cumulative_change DESC;



SELECT 
    commodity_name_en,
    unit_en,
    price_before_war,
    GREATEST(
        price_after_war, `price nov _2023`, `price dec_2023`, `price jan_2024`,
        `price feb_2024`, `price mar_2024`, `price apr_2024`, `price may_2024`,
        `price jun_2024`, `price july_2024`, `price aug_2024`, `price sep_2024`,
        `price oct_2024`, `price nov_2024`, `price dec_2024`, `price jan_2025`,
        `price feb_2025`, `price mar_2025`, `price apr_2025`, `price may_2025`,
        `price jun_2025`, `price july_2025`, `price aug_2025`, `price sep_2025`,
        `price oct_2025`, `price nov_2025`, `price dec_2025`
    ) AS peak_price,
    ROUND(((GREATEST(
        price_after_war, `price nov _2023`, `price dec_2023`, `price jan_2024`,
        `price feb_2024`, `price mar_2024`, `price apr_2024`, `price may_2024`,
        `price jun_2024`, `price july_2024`, `price aug_2024`, `price sep_2024`,
        `price oct_2024`, `price nov_2024`, `price dec_2024`, `price jan_2025`,
        `price feb_2025`, `price mar_2025`, `price apr_2025`, `price may_2025`,
        `price jun_2025`, `price july_2025`, `price aug_2025`, `price sep_2025`,
        `price oct_2025`, `price nov_2025`, `price dec_2025`
    ) - price_before_war) / price_before_war) * 100, 2) AS peak_increase_pct
FROM `gaza_prices_clean.csv`
ORDER BY peak_increase_pct DESC
LIMIT 15;

SELECT 
    'Oct-Nov 2023' AS month_period,
    COUNT(*) AS items_increased,
    ROUND(AVG(`Monthly Percent Change % (Nov.-Oct.)`), 2) AS avg_change
FROM `gaza_prices_clean.csv`
WHERE `Monthly Percent Change % (Nov.-Oct.)` > 0.2

UNION ALL

SELECT 
    'Nov-Dec 2023',
    COUNT(*),
    ROUND(AVG(`Monthly Percent Change % (Nov-Dec)`), 2)
FROM `gaza_prices_clean.csv`
WHERE `Monthly Percent Change % (Nov-Dec)` > 0.2;








