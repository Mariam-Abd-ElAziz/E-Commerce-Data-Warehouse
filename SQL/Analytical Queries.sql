
--Get Top 10 Products in revenue 
SELECT TOP 10
    P.product_key,
    P.product_name,
    SUM(FS.NetRevenue) AS Total_Sales
FROM 
    DWH.Fact_Sales AS FS
JOIN 
    DWH.D_Product AS P ON FS.ProductKey = P.product_key
GROUP BY 
    P.product_key,
    P.product_name
ORDER BY 
    Total_Sales DESC


--Get Most Used Method to payment with the total amount paid 
SELECT TOP 1
    PM.payment_method_name,
    COUNT(*) AS Usage_Count,
    SUM(FS.NetRevenue) AS Total_Amount
FROM 
    DWH.Fact_Sales AS FS
JOIN 
    DWH.D_PaymentMethod AS PM ON FS.PaymentMethodKey = PM.payment_method_key
GROUP BY 
    PM.payment_method_name
ORDER BY 
    Usage_Count DESC;

--Identify most valuable Customers 
SELECT C.customer_email, SUM(FS.NetRevenue) AS Total_Spent
FROM DWH.Fact_Sales FS
JOIN DWH.D_Customer C ON FS.CustomerKey = C.customer_key
GROUP BY C.customer_email
ORDER BY Total_Spent DESC;

--Trends over time (better used in graphcical view)
SELECT D.Month, D.Year, SUM(FS.NetRevenue) AS Monthly_Sales
FROM DWH.Fact_Sales FS
JOIN DWH.D_Date D ON FS.DateKey = D.DateKey
GROUP BY D.Year, D.Month
ORDER BY D.Year, D.Month;

--Identify the Top 3 reason for return products
SELECT TOP 3
R.reason, COUNT(R.reason) As Reason_count
FROM Fact_returns FR
JOIN DWH.D_return R ON FR.return_junk_key= R.junk_key
GROUP BY R.reason
ORDER BY Reason_count DESC;

--Show return trend ( better visualized) 
SELECT 
    d.Year,
    d.Month,
    COUNT(r.return_fact_key) AS total_returns
FROM fact_returns r
JOIN DWH.D_Date d ON r.date_key = d.DateKey
GROUP BY d.Year, d.Month
ORDER BY d.Year, d.Month;

--Identify customers who return very frequntly 
SELECT 
    c.customer_key,
	c.customer_email,
    COUNT(r.return_fact_key) AS total_returns
FROM fact_returns r
JOIN DWH.D_Customer c ON r.customer_key = c.customer_key
GROUP BY c.customer_key,
c.customer_email
HAVING COUNT(r.return_fact_key) >= 9  -- Threshold of frequent returns
ORDER BY total_returns DESC;


--get avg processing days to retrun

SELECT 
    AVG(processing_days) AS avg_processing_days
FROM fact_returns;

--Summary of campgain performance
SELECT 
    campaign_id,
    SUM(total_sales) AS total_sales,
    SUM(returned_amount) AS total_returns,
    SUM(net_sales) AS net_sales,
    ROUND((SUM(returned_amount) * 100.0) / NULLIF(SUM(total_sales), 0), 2) AS return_rate_percent
FROM [DWH.D_CampaignPerformanceFact]
GROUP BY campaign_id
ORDER BY net_sales DESC;

--Identify top 5 successed campgains 
SELECT TOP 5
    campaign_id,
    SUM(net_sales) AS net_sales
FROM [DWH.D_CampaignPerformanceFact]
GROUP BY campaign_id
ORDER BY net_sales DESC;