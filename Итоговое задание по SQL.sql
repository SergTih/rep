---- Задание 1.
Вывести все параметры из таблицы sales в базе данных
coffe_shop, относящиеся к покупкам, которые совершал Calvin Potter.

select *
from coffe_shop.sales
where customer_name ='Calvin Potter';

----- Задание 2.
Посчитать средний чек покупателей по дням

select
transaction_date,
avg(quantity * unit_price) as avg_bill
from coffe_shop.sales
group by 1
order by 1;

------Задание 3.
Преобразуйте дату транзакции в нужный формат: год, месяц, день.
Приведите названия продуктов к стандартному виду в нижнем регистре.

select 
transaction_date,
date_part('year', date(transaction_date)) as trans_year,
date_part('month', date(transaction_date)) as trans_month,
date_part('day', date(transaction_date)) as trans_day,
lower(product_name)
from coffe_shop.sales;

----Задание 4
Сделать анализ покупателей и разделить их по категориям. Посчитать количество транзакций, сделанных каждым покупателем. 
Разделить их на категории: Частые гости (>= 23 транзакций), Редкие посетители (< 10 транзакций), Стандартные посетители (все остальные)

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
Посчитать количество уникальных посетителей в каждом магазине каждый день.
	
select
transaction_date,
store_address,
count(distinct customer_id) as customers
from coffe_shop.sales
group by 2,1;
