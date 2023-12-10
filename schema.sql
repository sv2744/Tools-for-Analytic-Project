
CREATE TABLE IF NOT EXISTS nyc_zip_codes (
    zipcode VARCHAR(10) PRIMARY KEY
    boundary GEOMETRY(Polygon),
);


CREATE TABLE IF NOT EXISTS complaints_311 (
    complaint_id SERIAL PRIMARY KEY,
    geometry GEOMETRY(Point),
    zipcode VARCHAR(10),
    created_at TIMESTAMP,
    complaint_type VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS trees (
    tree_id SERIAL PRIMARY KEY,
    zipcode VARCHAR(10),
    created_at DATE,
    geometry GEOMETRY(Point),
    spc_common VARCHAR(255),
    health VARCHAR(50),
    status VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS historical_rents (
    id SERIAL PRIMARY KEY,
    zipcode VARCHAR(10),
    date DATE,
    average_rent NUMERIC
);  
