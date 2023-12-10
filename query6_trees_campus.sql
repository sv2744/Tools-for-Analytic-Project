
SELECT
    tree_id AS ID,
    spc_common AS species,
    health,
    status,
    ST_AsText(geometry) AS coordinate_location
FROM
    trees
WHERE
    ST_DWithin(geometry::geography, ST_GeomFromText(:point, 4326)::geography, 804.672);
