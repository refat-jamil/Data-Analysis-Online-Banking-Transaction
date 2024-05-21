## Project Overview:
This project looks at online banking transactions to find useful information for making decisions. The data comes from a MySQL database with four tables: area, region, customer joining, and customer transaction. The data is then processed, transformed, and loaded into a warehouse database using ETL (Extract, Transform, Load) techniques facilitated by Python. To visualize the analyzed data and insights, a dashboard is created using PowerBI


## ETL Process Overview: 
[ETL Script](https://github.com/refat-jamil/Data-Analysis-Online-Banking-Transaction/tree/main/ETL)
#### Full Truncation: 
- Entire Region and Area tables are extracted and loaded into a warehouse.
#### Incremental Load: 
- New or updated records are extracted from the source for customer id, customer joining and customer transaction tables. 
- Only Customer ID table are extracted, transformed and loaded into a warehouse  
- and others two table are extracted and loaded into a warehouse


## Warehouse Database Schema:
- Area Table: Contains information about different geographical areas.
- Region Table: Holds data regarding various regions.
- Customer Joining Table: Stores details about customers joining the online banking platform.
- Customer Transaction Table: Records transactions made by customers.
- Customer ID Table: All unique customers id sorted. 
![ERD](https://raw.githubusercontent.com/refat-jamil/Data-Analysis-Online-Banking-Transaction/main/img/ERD.png)



## Analysis:
Once the data is loaded into the warehouse database, various queries are executed to analyze the data based on specific [requirements](https://github.com/refat-jamil/Data-Analysis-Online-Banking-Transaction/blob/main/DDL/requirements.txt). These queries provide insights into customer behavior, transaction patterns, geographical trends, and more.

## Dashboard Creation:
To visualize the analyzed data and insights, a dashboard is created using PowerBI. The dashboard presents key metrics, trends, and visual representations of the data, making it easier for stakeholders to interpret and understand the findings.
#### Page 1
![Page 1](https://raw.githubusercontent.com/refat-jamil/Data-Analysis-Online-Banking-Transaction/main/img/1.jpeg)
#### Page 2

![Page 2](https://raw.githubusercontent.com/refat-jamil/Data-Analysis-Online-Banking-Transaction/main/img/2.jpeg)
#### Page 3

![Page 3](https://raw.githubusercontent.com/refat-jamil/Data-Analysis-Online-Banking-Transaction/main/img/3.jpeg)
