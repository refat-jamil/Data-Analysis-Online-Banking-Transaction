-- 1. How many unique customers are there?
select count(distinct cji.customer_id) unique_customer
from customer_joining_info cji;
	

-- 2. How many unique customers are coming from each region?
select 
	region_id, count( distinct customer_id) unique_customer 
from 
	customer_joining_info cji 
group by 
	region_id
order by 
	region_id

SELECT cji.region_id, r.region_name, COUNT(DISTINCT cji.customer_id) AS unique_customer 
FROM customer_joining_info cji 
INNER JOIN region r ON cji.region_id = r.region_id 
GROUP BY cji.region_id, r.region_name;

	
-- 3. How many unique customers are coming from each area?	
select a.area_id, a.name, count(distinct cji.customer_id) unique_customer
from customer_joining_info cji
inner join area a on cji.area_id = a.area_id 
group by a.area_id , a.name 

-- 4. What is the total amount for each transaction type?
select txn_type transaction_type, sum(txn_amount) total_amount  
from customer_transactions ct 
group by txn_type


-- 5. For each month - how many customers make more than 1 deposit and 1 withdrawal in a single month?

select month, count(customer_id) as customers
from 
	(select month, customer_id,  sum(deposit) deposit, sum(withdrawal) withdrawal
	from 
		(select  DATE_FORMAT(txn_date, '%Y-%m') AS month, customer_id, txn_type, 
		case when txn_type='deposit' then 1 else 0 end as deposit,
		case when txn_type='withdrawal' then 1 else 0 end as withdrawal
		from customer_transactions ct
		order by month, customer_id) daily_transaction
	group by month, customer_id
	having deposit > 1 and withdrawal > 1) each_customer_transaction
group by month
order by month;			

-- 6. What is closing balance for each customer?

select customer_id, sum(case when txn_type = 'withdrawal' then -txn_amount  else txn_amount end) as closing_balance
from customer_transactions ct
group by customer_id 
order by customer_id 

-- 7. What is the closing balance for each customer at the end of the month?

select customer_id, date_format(txn_date, '%Y-%m') as month, sum(case when txn_type = 'withdrawal' then -txn_amount  else txn_amount end) as closing_balance
from customer_transactions ct
group by customer_id, date_format(txn_date, '%Y-%m')
order by customer_id 

-- 8. Please show the latest 5 days total withdraw amount.

select *
from 
	(select txn_date tansaction_date , sum(txn_amount) total_withdraw_amount
	from customer_transactions ct
	where txn_type  = 'withdrawal'
	group by txn_date 
	order by txn_date desc
	limit 5) sub1
order by tansaction_date

-- 9. Find out the total deposit amount for every five days consecutive series. You can assume 1 week = 5 days. 
-- 	Please show the result week wise total amount.

select week, sum(txn_amount) total_amount
from 
	(select ceiling(dense_rank () over(order by txn_date) / 5) as week, ct.*
	from customer_transactions ct) sub1
where txn_type = 'deposit'
group by week


-- 10. Plase compare every weeks total deposit amount by the following previous wweek. 
-- 
-- 	Example: Week 1 will be compared with Week 2 [Calculation Week2 - Week 1]-> Next week - previous week
-- 		Week 2 will be compared with Week 3  [Calculation Week3 - Week 2]
-- 		---
-- 		--- 

select *, next_week_total_amount - total_amount difference
from 
	(select *, lead(week) over (order by week) as next_week, lead(total_amount) over (order by week) as next_week_total_amount
    from 
    	(select week, sum(txn_amount) as total_amount
        from 
        	(select ceiling(dense_rank() over (order by txn_date) / 5) as week, ct.*
            from customer_transactions ct
            ) as ranked_by_5_days_a_week
        where txn_type = 'deposit'
        group by week
        ) as total_weekly_deposits
    ) as weekly_deposit_comparison;


	
	

		

