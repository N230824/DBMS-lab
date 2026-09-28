use taxation ;
show tables;

/* level */
create view highest_income as 
select * from income_record 
where amount =(select max(amount) from income_record);
select * from highest_income;

create view lowest_income as 
select * from income_record 
where amount =(select max(amount) from income_record);
select * from lowest_income;

create view average_income as 
select * from income_record 
where amount >(select avg(amount) from income_record);
select * from lowest_income;

create view highest_incomes as 
select * from income_record 
where amount =(select max(amount) from income_record);
select * from highest_incomes;

create view bussiness_owner as 
select * from taxpayer
where occupation='bussiness owner';
select * from bussiness_owner;

/* level 2 */
create view taxpayer_income as
select * from taxpayer 
where taxpayer_id in(select taxpayer_id from income_record);
select * from taxpayer_income;

create view taxpayer_income_business as
select * from taxpayer 
where taxpayer_id in(select taxpayer_id from income_record
where category_id= (select category_id from income_category
where category_name='business'));
select * from taxpayer_income_business;

create view financial_incomes as
select ir.* from income_record ir 
join financial_year fy
on  ir.year_id=fy.year_id
where fy.year_label='2025-2026';
select * from financial_incomes;

create view income_business_salary as
select * from income_record
where amount > (select min(amount) from income_record
where category_id= (select category_id from income_category
where category_name='business'));
select * from income_business_salary;

create view income_business_salary as
select * from income_record
where amount > (select min(amount) from income_record
where category_id= (select category_id from income_category
where category_name='business'));
select * from income_business_salary;

create view income_business_salary as
select * from income_record
where amount > (select min(amount) from income_record
where category_id= (select category_id from income_category
where category_name='business'));
select * from income_business_salary;

create view income_business_salarys as
select * from income_record
where amount < (select max(amount) from income_record
where category_id= (select category_id from income_category
where category_name='salary'));
select * from income_business_salarys;

create view taxpayer_avg_income as 
select * from taxpayer
where taxpayer_id in( select taxpayer_id from income_record 
where amount > (select avg(amount) from income_record));
select * from taxpayer_avg_income;

create view income_categories as
select * from income_category
where category_id in (select category_id from income_record);
select * from income_categories;

create view no_investment_income as
select * from taxpayer 
where taxpayer_id not in(select taxpayer_id from income_record
where category_id= (select category_id from income_category
where category_name='house property'));
select * from no_investment_income;

/* level 3 */
create view highest_income_taxpayer as 
select * from taxpayer 
where taxpayer_id=
(select taxpayer_id from income_record 
where amount =(select max(amount) from income_record));
select * from highest_income_taxpayer;

create view income_business_avg as
select * from income_record
where amount > (select avg(amount) from income_record
where category_id= (select category_id from income_category
where category_name='business'));
select * from income_business_avg;

/*create view taxpayer_total_avg as
select  taxpayer_id,sum(amount) as total_income
from income_record
group by taxpayer_id
having sum(amount)>(select avg(total_income) from */

create view income_business_anys as
select * from income_record
where amount > any(select amount from income_record
where category_id= (select category_id from income_category
where category_name='business'));
select * from income_business_anys;





















