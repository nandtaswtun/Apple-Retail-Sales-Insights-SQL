📝 Project Overview
This repository contains a specialized SQL toolkit designed to analyze the full lifecycle of Apple products, from launch-day impact to long-term warranty support.

1. Annual Product Launch Impact Analysis
The primary report has been updated to track the one-year trajectory of product sales. By leveraging Window Functions (LEAD, LAG) and date arithmetic, the query:

Calculates total revenue and quantity for products relative to their release dates.

Projects a one-year performance window (DATE_ADD of 1 year) to identify long-term adoption rates and post-launch stability.

Automates the calculation of release milestones to help stakeholders understand "year-over-year" performance within specific product categories.

2. Multi-Dimensional Sales Intelligence
The script includes robust aggregation logic to break down financial performance across the global retail footprint:

Store-Level Performance: Aggregates unit volume and gross revenue for individual store locations.

National Market Analysis: Summarizes sales data by country, allowing for high-level geographic strategic planning.

3. Service & Reliability (Warranty) Analysis
To measure product quality and service efficiency, the analysis joins Warranty and Category data to:

Identify which product categories generate the highest volume of repair requests.

Filter and group claims by repair_status (e.g., Completed, Pending) to monitor the health of the after-sales pipeline.

Technical Competencies:

Advanced Data Transformation: Complex joins across five relational tables (Stores, Sales, Products, Category, Warranty).

Temporal Logic: Advanced use of DATE_SUB, DATE_ADD, and MONTH() for time-series reporting.

Data Structure Optimization: Extensive use of Derived Tables (Subqueries) to ensure high-performance calculations of calculated fields like Total_Sales.
