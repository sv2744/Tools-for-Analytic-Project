
    SELECT t.zipcode, 
           TO_CHAR(AVG(hr.average_rent), 'FM999,999,999.99') as formatted_avg_rent
    FROM trees t
    JOIN historical_rents hr ON t.zipcode = hr.zipcode
    WHERE t.zipcode IN (
        SELECT zipcode
        FROM trees
        GROUP BY zipcode
        ORDER BY COUNT(*) DESC
        LIMIT 10
    )
    AND hr.date >= '2023-08-01' AND hr.date <= '2023-08-31'
    GROUP BY t.zipcode
    ORDER BY COUNT(*) DESC;
