CREATE DATABASE biz_db;

USE biz_db;

CREATE TABLE grocery_sales (
    item_fat_content VARCHAR(20),
    item_identifier VARCHAR(20),
    item_type VARCHAR(50),
    outlet_establishment_year INT,
    outlet_identifier VARCHAR(20),
    outlet_location_type VARCHAR(30),
    outlet_size VARCHAR(20),
    outlet_type VARCHAR(40),
    item_visibility DECIMAL(10,6),
    item_weight DECIMAL(10,2),
    sales DECIMAL(12,2),
    rating DECIMAL(3,2)
);

SELECT COUNT(*) AS total_rows FROM grocery_sales;

SELECT * FROM grocery_sales LIMIT 10;

-- 1 Total Sales
SELECT SUM(sales) AS total_sales FROM grocery_sales;

-- 2 Average Sales
SELECT AVG(sales) AS average_sales FROM grocery_sales;

-- 3 Average Rating
SELECT AVG(rating) AS average_rating FROM grocery_sales;

-- 4 Total Products
SELECT COUNT(DISTINCT item_identifier) AS total_products FROM grocery_sales;

-- 5 Total Outlets
SELECT COUNT(DISTINCT outlet_identifier) AS total_outlets FROM grocery_sales;

-- 6 Sales by Item Fat Content
SELECT item_fat_content, SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY item_fat_content
ORDER BY total_sales DESC;

-- 7 Sales by Outlet Type
SELECT outlet_type, SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_type
ORDER BY total_sales DESC;

-- 8 Sales by Outlet Size
SELECT outlet_size, SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_size
ORDER BY total_sales DESC;

-- 9 Sales by Item Type
SELECT item_type, SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY item_type
ORDER BY total_sales DESC;

-- 10 Sales by Outlet Location Type
SELECT outlet_location_type, SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_location_type
ORDER BY total_sales DESC;

-- 11 Average Sales by Outlet Type
SELECT outlet_type, AVG(sales) AS average_sales
FROM grocery_sales
GROUP BY outlet_type
ORDER BY average_sales DESC;

-- 12 Average Rating by Outlet Type
SELECT outlet_type, AVG(rating) AS average_rating
FROM grocery_sales
GROUP BY outlet_type
ORDER BY average_rating DESC;

-- 13 Sales by Establishment Year
SELECT outlet_establishment_year, SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year;

-- 14 Sales by Outlet Identifier
SELECT outlet_identifier, SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_identifier
ORDER BY total_sales DESC;

-- 15 Top 10 Products by Sales
SELECT item_identifier, SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY item_identifier
ORDER BY total_sales DESC
LIMIT 10;

-- 16 Average Sales by Item Type
SELECT item_type, AVG(sales) AS average_sales
FROM grocery_sales
GROUP BY item_type
ORDER BY average_sales DESC;

-- 17 Sales by Fat Content and Outlet Type
SELECT item_fat_content, outlet_type, SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY item_fat_content, outlet_type
ORDER BY total_sales DESC;

-- 18 Sales by Outlet Type and Outlet Size
SELECT outlet_type, outlet_size, SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_type, outlet_size
ORDER BY total_sales DESC;

-- 19 Top 10 Item Types by Average Sales
SELECT item_type, AVG(sales) AS average_sales
FROM grocery_sales
GROUP BY item_type
ORDER BY average_sales DESC
LIMIT 10;

-- 20 Outlet Performance Ranking
SELECT 
    outlet_identifier,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM grocery_sales
GROUP BY outlet_identifier
ORDER BY sales_rank;										

-- 21 Sales by Item Type and Outlet Type
SELECT 
    item_type,
    outlet_type,
    SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY item_type, outlet_type
ORDER BY total_sales DESC;

-- 22 Sales by Outlet Location and Fat Content
SELECT 
    outlet_location_type,
    item_fat_content,
    SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_location_type, item_fat_content
ORDER BY total_sales DESC;

-- 23 Average Rating by Item Type
SELECT 
    item_type,
    AVG(rating) AS average_rating
FROM grocery_sales
GROUP BY item_type
ORDER BY average_rating DESC;

-- 24 Sales by Establishment Year and Outlet Type
SELECT 
    outlet_establishment_year,
    outlet_type,
    SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_establishment_year, outlet_type
ORDER BY outlet_establishment_year, total_sales DESC;

-- 25 Average Item Visibility by Outlet Type
SELECT 
    outlet_type,
    AVG(item_visibility) AS average_visibility
FROM grocery_sales
GROUP BY outlet_type
ORDER BY average_visibility DESC;

-- 26 Average Item Weight by Outlet Type
SELECT 
    outlet_type,
    AVG(item_weight) AS average_weight
FROM grocery_sales
GROUP BY outlet_type
ORDER BY average_weight DESC;

-- 27 Sales by Rating
SELECT 
    rating,
    SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY rating
ORDER BY rating;

-- 28 Average Sales by Item Fat Content
SELECT 
    item_fat_content,
    AVG(sales) AS average_sales
FROM grocery_sales
GROUP BY item_fat_content
ORDER BY average_sales DESC;

-- 29 Average Rating by Outlet Location Type
SELECT 
    outlet_location_type,
    AVG(rating) AS average_rating
FROM grocery_sales
GROUP BY outlet_location_type
ORDER BY average_rating DESC;

-- 30 Sales by Item Type and Fat Content
SELECT 
    item_type,
    item_fat_content,
    SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY item_type, item_fat_content
ORDER BY total_sales DESC;

-- 31 Average Sales by Outlet Size
SELECT 
    outlet_size,
    AVG(sales) AS average_sales
FROM grocery_sales
GROUP BY outlet_size
ORDER BY average_sales DESC;

-- 32 Sales by Outlet Location and Outlet Size
SELECT 
    outlet_location_type,
    outlet_size,
    SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_location_type, outlet_size
ORDER BY total_sales DESC;

-- 33 Average Item Visibility by Fat Content
SELECT 
    item_fat_content,
    AVG(item_visibility) AS average_visibility
FROM grocery_sales
GROUP BY item_fat_content
ORDER BY average_visibility DESC;

-- 34 Average Item Weight by Outlet Location
SELECT 
    outlet_location_type,
    AVG(item_weight) AS average_weight
FROM grocery_sales
GROUP BY outlet_location_type
ORDER BY average_weight DESC;

-- 35 Average Rating by Outlet Size
SELECT 
    outlet_size,
    AVG(rating) AS average_rating
FROM grocery_sales
GROUP BY outlet_size
ORDER BY average_rating DESC;

-- 36 Average Item Visibility by Outlet Location
SELECT 
    outlet_location_type,
    AVG(item_visibility) AS average_visibility
FROM grocery_sales
GROUP BY outlet_location_type
ORDER BY average_visibility DESC;

-- 37 Sales by Item Identifier
SELECT 
    item_identifier,
    SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY item_identifier
ORDER BY total_sales DESC;

-- 39 Average Sales by Item Identifier
SELECT 
    item_identifier,
    AVG(sales) AS average_sales
FROM grocery_sales
GROUP BY item_identifier
ORDER BY average_sales DESC
LIMIT 10;

-- 40 Sales by Outlet Type and Fat Content
SELECT 
    outlet_type,
    item_fat_content,
    SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_type, item_fat_content
ORDER BY total_sales DESC;

-- 41 Data Validation: Check Missing Values
SELECT
    SUM(item_fat_content IS NULL) AS missing_fat_content,
    SUM(item_identifier IS NULL) AS missing_item_id,
    SUM(item_type IS NULL) AS missing_item_type,
    SUM(outlet_establishment_year IS NULL) AS missing_year,
    SUM(outlet_identifier IS NULL) AS missing_outlet_id,
    SUM(outlet_location_type IS NULL) AS missing_location,
    SUM(outlet_size IS NULL) AS missing_outlet_size,
    SUM(outlet_type IS NULL) AS missing_outlet_type,
    SUM(item_visibility IS NULL) AS missing_visibility,
    SUM(item_weight IS NULL) AS missing_weight,
    SUM(sales IS NULL) AS missing_sales,
    SUM(rating IS NULL) AS missing_rating
FROM grocery_sales;

-- 42 Check Duplicate Records
SELECT 
    item_identifier,
    outlet_identifier,
    COUNT(*) AS record_count
FROM grocery_sales
GROUP BY item_identifier, outlet_identifier
HAVING COUNT(*) > 1;

-- 43 Sales by Outlet Establishment Year and Fat Content
SELECT 
    outlet_establishment_year,
    item_fat_content,
    SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_establishment_year, item_fat_content
ORDER BY outlet_establishment_year, total_sales DESC;

-- 44 Average Rating by Fat Content
SELECT 
    item_fat_content,
    AVG(rating) AS average_rating
FROM grocery_sales
GROUP BY item_fat_content
ORDER BY average_rating DESC;

-- Sales by Outlet Size and Fat Content
SELECT 
    outlet_size,
    item_fat_content,
    SUM(sales) AS total_sales
FROM grocery_sales
GROUP BY outlet_size, item_fat_content
ORDER BY total_sales DESC;

-- 46 Sales Contribution by Outlet Type
SELECT 
    outlet_type,
    SUM(sales) AS total_sales,
    ROUND(
        SUM(sales) * 100.0 / (SELECT SUM(sales) FROM grocery_sales),
        2
    ) AS sales_percentage
FROM grocery_sales
GROUP BY outlet_type
ORDER BY sales_percentage DESC;

-- 47 High-Value Products Using CASE
SELECT
    item_identifier,
    sales,
    CASE
        WHEN sales >= 250 THEN 'High Sales'
        WHEN sales >= 150 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category
FROM grocery_sales
ORDER BY sales DESC;

-- 48 Products Above Average Sales
SELECT
    item_identifier,
    sales
FROM grocery_sales
WHERE sales > (
    SELECT AVG(sales)
    FROM grocery_sales
)
ORDER BY sales DESC;

-- 49 Outlet Performance vs Overall Average
WITH outlet_sales AS (
    SELECT
        outlet_identifier,
        SUM(sales) AS total_sales
    FROM grocery_sales
    GROUP BY outlet_identifier
)
SELECT
    outlet_identifier,
    total_sales,
    ROUND(AVG(total_sales) OVER (), 2) AS average_outlet_sales,
    CASE
        WHEN total_sales > AVG(total_sales) OVER ()
            THEN 'Above Average'
        ELSE 'Below Average'
    END AS performance
FROM outlet_sales
ORDER BY total_sales DESC;

-- 50 Running Sales by Outlet
WITH outlet_sales AS (
    SELECT
        outlet_identifier,
        SUM(sales) AS total_sales
    FROM grocery_sales
    GROUP BY outlet_identifier
)
SELECT
    outlet_identifier,
    total_sales,
    SUM(total_sales) OVER (
        ORDER BY total_sales DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM outlet_sales
ORDER BY total_sales DESC;

-- 51 Top 3 Products Within Each Outlet
WITH product_sales AS (
    SELECT
        outlet_identifier,
        item_identifier,
        SUM(sales) AS total_sales
    FROM grocery_sales
    GROUP BY outlet_identifier, item_identifier
),
ranked_products AS (
    SELECT
        outlet_identifier,
        item_identifier,
        total_sales,
        DENSE_RANK() OVER (
            PARTITION BY outlet_identifier
            ORDER BY total_sales DESC
        ) AS product_rank
    FROM product_sales
)
SELECT
    outlet_identifier,
    item_identifier,
    total_sales,
    product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY outlet_identifier, product_rank;

-- 52 Sales Contribution of Each Product Category
WITH category_sales AS (
    SELECT
        outlet_type,
        item_type,
        SUM(sales) AS category_sales
    FROM grocery_sales
    GROUP BY outlet_type, item_type
)
SELECT
    outlet_type,
    item_type,
    category_sales,
    ROUND(
        category_sales * 100.0 /
        SUM(category_sales) OVER (PARTITION BY outlet_type),
        2
    ) AS outlet_sales_percentage
FROM category_sales
ORDER BY outlet_type, outlet_sales_percentage DESC;

-- 53 Above-Average Product Categorie
SELECT
    item_type,
    ROUND(AVG(sales), 2) AS average_sales
FROM grocery_sales
GROUP BY item_type
HAVING AVG(sales) > (
    SELECT AVG(sales)
    FROM grocery_sales
)
ORDER BY average_sales DESC;

-- 54 Best-Selling Product in Each Outlet
WITH product_sales AS (
    SELECT
        outlet_identifier,
        item_identifier,
        SUM(sales) AS total_sales
    FROM grocery_sales
    GROUP BY outlet_identifier, item_identifier
),
ranked_products AS (
    SELECT
        outlet_identifier,
        item_identifier,
        total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY outlet_identifier
            ORDER BY total_sales DESC
        ) AS row_num
    FROM product_sales
)
SELECT
    outlet_identifier,
    item_identifier,
    total_sales
FROM ranked_products
WHERE row_num = 1
ORDER BY total_sales DESC;

-- 55 Outlet Sales Performance Category
WITH outlet_sales AS (
    SELECT
        outlet_identifier,
        SUM(sales) AS total_sales
    FROM grocery_sales
    GROUP BY outlet_identifier
),
segmented_outlets AS (
    SELECT
        outlet_identifier,
        total_sales,
        NTILE(4) OVER (ORDER BY total_sales DESC) AS sales_quartile
    FROM outlet_sales
)
SELECT
    outlet_identifier,
    total_sales,
    sales_quartile,
    CASE
        WHEN sales_quartile = 1 THEN 'Top Performer'
        WHEN sales_quartile = 2 THEN 'Above Average'
        WHEN sales_quartile = 3 THEN 'Below Average'
        ELSE 'Low Performer'
    END AS performance_category
FROM segmented_outlets
ORDER BY total_sales DESC;

-- 56 Sales Efficiency by Outlet Type
SELECT
    outlet_type,
    SUM(sales) AS total_sales,
    COUNT(*) AS total_records,
    ROUND(SUM(sales) / COUNT(*), 2) AS sales_per_record
FROM grocery_sales
GROUP BY outlet_type
ORDER BY sales_per_record DESC; 