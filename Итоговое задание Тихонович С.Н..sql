---- Задание 1.
select *
from coffe_shop.sales
where customer_name ='Calvin Potter';

----- Задание 2.
select
transaction_date,
avg(quantity * unit_price) as avg_bill
from coffe_shop.sales
group by 1
order by 1;

------Задание 3.
select 
transaction_date,
date_part('year', date(transaction_date)) as trans_year,
date_part('month', date(transaction_date)) as trans_month,
date_part('day', date(transaction_date)) as trans_day,
lower(product_name)
from coffe_shop.sales;

----Задание 4

select
customer_id,
customer_name,
count(customer_name) as transactions,
case 
	when count(customer_name)>=23 then 'Частый гость'
	when count(customer_name)<=10 then 'Редкий гость'
	else 'Стандартные посетители'
end as customer_category
from coffe_shop.sales
group by 1,2
order by 3 desc;

-----Задание 5

select
transaction_date,
store_address,
count(distinct customer_id) as customers
from coffe_shop.sales
group by 2,1;
