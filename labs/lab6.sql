use taxation;
show tables;
/* level 1 */
select *
from income_record
where amount = (select max(amount) from income_record);

select *
from income_record
where amount = (select min(amount) from income_record);

select *
from income_record
where amount > (select avg(amount) from income_record);

select *
from income_record
where amount = (select max(amount) from income_record);

select *
from taxpayer
where taxpayer_id  in (select taxpayer_id   from  taxpayer
where occupation='bussiness owner');

/* level 2 */
select * from taxpayer
where taxpayer_id in( select taxpayer_id from  income_record);

select * from taxpayer
where taxpayer_id in( select taxpayer_id from  income_record
where category_id =(select category_id from income_category where category_name='business'));

select * from income_record
where year_id =(select year_id from financial_year where year_label='2025-2026');

select * from income_record
where amount > (select min(amount) from income_record
where category_id =(select category_id from income_category
where category_name='business'));

select * from income_record
where amount < (select max(amount) from income_record
where category_id =(select category_id from income_category
where category_name='salary'));

select * from taxpayer
where taxpayer_id in (select taxpayer_id from income_record
where amount > ( select avg(amount) from income_record));

select * from income_category
where category_id in (select category_id from income_record);

select * from taxpayer
where taxpayer_id not in (select taxpayer_id from income_record
where category_id =(select category_id from income_category
where category_name='house property'));

/* level 3 */
select * from taxpayer
where taxpayer_id=(select  taxpayer_id from income_record where amount =(select max(amount) from income_record));

select * from income_record
where amount > (select avg(amount) from income_record
where category_id =(select category_id from income_category
where category_name='business'));

select * from taxpayer
where taxpayer_id in(select  taxpayer_id from income_record 
where amount > (select avg(amount) from income_record));

select * from income_record
where amount >  any (select amount  from income_record
where category_id =(select category_id from income_category
where category_name='house property'));

select * from income_record
where amount >   all (select amount from income_record
where category_id =(select category_id from income_category
where category_name='house property'));

select * from income_record;

select * from income_category
where category_id = ( select category_id from income_record
where amount= ( select max(amount) from income_record));

select * from financial_year
where year_id = ( select year_id from income_record
group by year_id 
order by sum(amount) 
desc limit 1 );
