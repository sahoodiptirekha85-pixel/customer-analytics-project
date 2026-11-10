use project_customer_segmentation;
select * from customer;
--  1.	How is the shopping distribution according to gender?
select gender, count(*) as total_transactions from customer group by gender;
-- 2.	Which gender did we sell more products to?
select  gender, sum(quantity) as total_product_sold from customer group by gender order by total_product_sold desc;
-- 3.	Which gender generated more revenue?
select gender, sum(quantity*price) as total_revenew from customer group by gender order by total_revenew desc;
-- 4.	Distribution of purchase categories relative to other columns? 
select category, sum(quantity) as total_purchase_volume, sum(quantity*price)as total_revenue from customer group by category order by total_revenue desc;
-- 5.	How is the shopping distribution according to age?
select case when age between 18 and 25 then '18-25(youth)'
when age between 26 and 35 then '26-35(young adult)'
when age between 36 and 50 then '36-50 (adult)'
when age between 51 and 65 then '51-65 (senior)'
else '65+(elderly)' end as age_bracket,
count(*) as total_transaction, sum(quantity) as total_quantity, sum(quantity*price) as total_revenue from customer 
group by age_bracket order by total_revenue desc;
-- 6.	Which age cat did we sell more products to?
select case when age between 18 and 25 then '18-25'
when age between 26 and 35 then  '26-35'
when age between 36 and 50 then '36-50'
when age between 51 and 65 then '51-65'
else '65+' end as age_bracket,
 sum(quantity) as total_quantity from customer
 group by age_bracket order by total_quantity desc;
 -- 7.	Which age cat generated more revenue?
 select case when age between 18 and 25 then '18-25'
 when age between 26 and 35 then '26-35'
 when age between 36 and 50 then '36-50'
 when age between 51 and 65 then '51-65'
 else '65+' end as age_bracket,
 sum(quantity*price) as total_reveneu from customer group by age_bracket order by total_reveneu desc;
-- 8.	Distribution of purchase categories relative to other columns?
select shopping_mall, category, sum(quantity*price) as total_revenue from customer group by
shopping_mall, category order by shopping_mall, total_revenue desc;
-- 9.	Does the payment method have a relation with other columns?
select case when age between 18 and 25 then '18-25(youth)'
when age between 26 and 35 then '26-35(young adult)'
when age between 36 and 50 then '36-50(adult)'
when age between 50 and 65 then '50-65(elder)'
else '65+' end as age_bracket, payment_method,count(*) as transaction_count from customer group by age_bracket,payment_method
order by age_bracket, transaction_count desc;
-- 10.	How is the distribution of the payment method?
select payment_method, count(*) as total_usage, sum(quantity*price) as total_revenue from customer group by
payment_method order by total_usage desc;

