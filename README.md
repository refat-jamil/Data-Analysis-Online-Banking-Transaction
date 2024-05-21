
# Data Analyst - Online Banking Transaction

## Project Overview:
This project looks at online banking transactions to find useful information for making decisions. The data comes from a MySQL database with four tables: area, region, customer joining, and customer transaction. The data is then processed, transformed, and loaded into a warehouse database using ETL (Extract, Transform, Load) techniques facilitated by Python. To visualize the analyzed data and insights, a dashboard is created using PowerBI

## Database Schema:
- Area Table: Contains information about different geographical areas.
- Region Table: Holds data regarding various regions.
- Customer Joining Table: Stores details about customers joining the online banking platform.
- Customer Transaction Table: Records transactions made by customers.


## ETL Process Overview:
#### Full Truncation: 
Entire region and area tables are extracted, transformed, and loaded into a warehouse.
#### Incremental Load: 
Only new or updated records are extracted from the source for customer joining and customer transaction tables. These are then transformed and appended to the destination tables, maintaining existing data integrity.

## Analysis:
Once the data is loaded into the warehouse database, various queries are executed to analyze the data based on specific requirements. These queries provide insights into customer behavior, transaction patterns, geographical trends, and more.

## Dashboard Creation:
To visualize the analyzed data and insights, a dashboard is created using PowerBI. The dashboard presents key metrics, trends, and visual representations of the data, making it easier for stakeholders to interpret and understand the findings
