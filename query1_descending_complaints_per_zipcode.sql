
SELECT zipcode, COUNT(*) as complaint_count
FROM complaints_311
WHERE created_at BETWEEN '2022-10-01' AND '2023-09-30'
GROUP BY zipcode
ORDER BY complaint_count DESC;
