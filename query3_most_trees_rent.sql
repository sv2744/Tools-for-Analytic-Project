
SELECT t.zipcode, t.tree_count, AVG(r.average_rent) as average_rent
FROM (
    SELECT zipcode, COUNT(*) as tree_count
    FROM trees
    GROUP BY zipcode
    ORDER BY tree_count DESC
    LIMIT 10
) t
JOIN historical_rents r ON t.zipcode = r.zipcode
WHERE r.date >= '2023-08-01' AND r.date < '2023-09-01'
GROUP BY t.zipcode, t.tree_count
ORDER BY t.tree_count DESC;
