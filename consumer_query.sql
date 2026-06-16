SELECT * FROM Consumer_Complaints_1;




--How many total complaints are in the dataset?
SELECT 
     COUNT(*)  AS total_complaints
FROM Consumer_Complaints_1;



--How many complaints were submitted via Web vs Referral vs Phone?
SELECT 
    Submitted_via,
    COUNT(*) AS total_submitted_complains
FROM Consumer_Complaints_1
GROUP BY Submitted_via
ORDER BY total_submitted_complains DESC;



--What are the top 5 most complained-about products?
SELECT TOP 5
       Product,
       COUNT(*) AS top_5_products
FROM Consumer_Complaints_1
GROUP BY Product
ORDER BY top_5_products DESC;


--How many complaints came from each state? (Top 10)
SELECT TOP 10
       State,
       COUNT(*) AS top_10_by_state
FROM Consumer_Complaints_1
GROUP BY State
ORDER BY top_10_by_state  DESC;



--Which issue type has the most complaints?
SELECT TOP 1
      Issue,
      COUNT(*) AS top_issue_complaints
FROM Consumer_Complaints_1
GROUP BY Issue
ORDER BY top_issue_complaints DESC;


--How many complaints per product?
SELECT 
    Product,
    COUNT(*) AS complain_per_product
FROM Consumer_Complaints_1
GROUP BY Product
ORDER BY  complain_per_product DESC;



 --What's the most common company response type?
 SELECT TOP 1
        Company_response_to_consumer,
        COUNT(*) AS common_company_response
FROM Consumer_Complaints_1
GROUP BY Company_response_to_consumer
ORDER BY common_company_response DESC;



-- For the top 3 products, how many complaints each received timely responses?
SELECT TOP 3 
    Product,
    timely_response,
    COUNT(*) AS total_timely_response
FROM Consumer_Complaints_1
GROUP BY Product , Timely_response
ORDER BY total_timely_response DESC;


--What's the average number of complaints per state?
WITH state_complaints AS (
    SELECT 
        State,
        COUNT(*) AS complaints_count
    FROM Consumer_Complaints_1
    GROUP BY State
)
SELECT 
    AVG(complaints_count) AS average_complaints_per_state
FROM state_complaints



--How many monetary relief responses vs explanation-only responses?
SELECT 
    Company_response_to_consumer,
    COUNT(*) AS response_count
FROM Consumer_Complaints_1
WHERE Company_response_to_consumer IN ('Closed with monetary relief', 'Closed with explanation')
GROUP BY Company_response_to_consumer
ORDER BY response_count DESC

--How many unique states have complaints?
SELECT 
     COUNT (DISTINCT State ) AS unique_state
FROM Consumer_Complaints_1


--Which state had the least complaints?
SELECT TOP 1
     State,
     COUNT (*) AS least_state
FROM Consumer_Complaints_1
GROUP BY State
ORDER BY least_state ASC;


--How many complaints per submission channel?
SELECT 
    Submitted_via,
    COUNT (*) AS total_submission
FROM Consumer_Complaints_1
GROUP BY Submitted_via
ORDER BY total_submission DESC;