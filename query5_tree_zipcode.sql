
    SELECT z.zipcode, COUNT(*) as total_trees
    FROM nyc_zip_codes z
    JOIN trees t ON ST_Within(t.geometry, z.boundary)
    GROUP BY z.zipcode
    ORDER BY total_trees DESC
    LIMIT 10;
