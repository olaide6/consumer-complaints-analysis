SELECT * FROM Consumer_Complaints_1;


--Which products have the highest number of consumer complaints?
SELECT  TOP 1
       Product,
       COUNT(*) AS highest_consumer_complaints
FROM Consumer_Complaints_1
GROUP BY Product
ORDER BY Product ASC;



--What is the distribution of timely responses — how many complaints received a Yes, No, or Unknown response?
SELECT Timely_response,
       COUNT(*) AS total_timely_response
FROM Consumer_Complaints_1
GROUP BY Timely_response
ORDER BY  Timely_response DESC;



--Which sub-products are consumers complaining about the most?
SELECT Sub_product,
       COUNT(*) AS total_complaint_by_subp
FROM Consumer_Complaints_1
GROUP BY Sub_product
ORDER BY Sub_product ASC;



--What are the most common ways the company responded to consumers?
SELECT Company_response_to_consumer,
      COUNT(*) AS company_response
FROM Consumer_Complaints_1
GROUP BY Company_response_to_consumer
ORDER BY company_response DESC;




--Which states have the most complaints and what are the full complaint details for each state?
SELECT State,
       COUNT(*) AS total_complaints
FROM Consumer_Complaints_1
GROUP BY state