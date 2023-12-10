
    SELECT * FROM (
        SELECT
            hr.zipcode,
            AVG(hr.average_rent),
            tc.tree_count,
            cc.complaint_count,
            'Lowest' as Rent_Category
        FROM
            historical_rents hr
        INNER JOIN 
            (SELECT zipcode, COUNT(*) AS tree_count FROM trees GROUP BY zipcode) tc
        ON
            hr.zipcode = tc.zipcode
        INNER JOIN 
            (SELECT zipcode, COUNT(*) AS complaint_count FROM complaints_311 GROUP BY zipcode) cc
        ON 
            hr.zipcode = cc.zipcode
        WHERE
            hr.date >= '2023-01-01' AND hr.date <= '2023-01-31'
        GROUP BY
            hr.zipcode, tc.tree_count, cc.complaint_count
        ORDER BY
            AVG(hr.average_rent) ASC
        LIMIT 5
    ) as Lowest

    UNION ALL

    SELECT * FROM (
        SELECT
            hr.zipcode,
            AVG(hr.average_rent),
            tc.tree_count,
            cc.complaint_count,
            'Highest' as Rent_Category
        FROM
            historical_rents hr
        INNER JOIN 
            (SELECT zipcode, COUNT(*) AS tree_count FROM trees GROUP BY zipcode) tc
        ON
            hr.zipcode = tc.zipcode
        INNER JOIN 
            (SELECT zipcode, COUNT(*) AS complaint_count FROM complaints_311 GROUP BY zipcode) cc
        ON 
            hr.zipcode = cc.zipcode
        WHERE
            hr.date >= '2023-01-01' AND hr.date <= '2023-01-31'
        GROUP BY
            hr.zipcode, tc.tree_count, cc.complaint_count
        ORDER BY
            AVG(hr.average_rent) DESC
        LIMIT 5
    ) as Highest;
