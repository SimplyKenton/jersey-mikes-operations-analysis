--Difference in Sales Numbers Grouped By Days of the Week
SELECT Day, ROUND(SUM(Forcasted_Sales - Daily_Net_Sales) , 2) AS Sales_Difference
FROM New_9037
GROUP BY Day
ORDER BY Sales_Difference ASC;


--Hours Varaince Grouped By Days of the week
SELECT Day, avg(Daily_Bread_Manhours_Variance) AS Hours_Variance
FROM New_9037
GROUP BY Day
ORDER BY Hours_Variance DESC;

-- Comparing Thursday And Saturday Performance
SELECT Day,
    AVG(Daily_Bread_Manhours_Variance) AS Avg_Variance,
    AVG(Daily_Net_Sales) AS Avg_Sales, 
    AVG(Forcasted_Sales) AS Avg_Forecasted_Sales
FROM New_9037
WHERE Day IN ("Thursday", "Saturday")
GROUP BY Day;


-- Average Daily Labor Numbers by Day of Week
SELECT Day, 
    AVG(Daily_Manhours_Used) AS Avg_Hours_Used,
    AVG(Daily_Bread_Hourly_Manhours_Allowed) AS Avg_Hours_Allowed,
    AVG(Daily_Bread_Manhours_Variance) AS Avg_Variance
FROM New_9037
GROUP BY Day
ORDER BY Avg_Variance DESC;


-- Cost Impact Analysis (supports your $3,960 savings finding)
SELECT Day,
    COUNT(*) AS Days_Analyzed,
    AVG(Daily_Bread_Manhours_Variance) AS Avg_Variance,
    ROUND(AVG(Daily_Bread_Manhours_Variance) * 15 * 4, 2) AS Monthly_Cost_Impact
FROM New_9037
GROUP BY Day
ORDER BY Monthly_Cost_Impact;

