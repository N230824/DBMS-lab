use taxation;
show tables;

select upper(full_name)
from taxpayer;

select lower(occupation)
from taxpayer;

select length(full_name)
from taxpayer;

select left(pan_number,4)
from taxpayer;

select concat(full_name,'-',occupation)
from taxpayer;

select replace(category_name,'Income','Inc.')
from income_category;

select trim(full_name)
from taxpayer;

select substring_index2(full_name,'',1)
from taxpayer;

select concat('taxpayer:',full_name,'\nOccupation:',occupation )as details
from taxpayer;

select * from taxpayer
where pan_number like 'AP%';

/*part c */
select round(amount)from income_record;

select abs(amount-850000) 
from income_record;

select power(amount,2) from income_record;

select mod(amount,1200) from income_record;

select round(amount,2) from income_record;

select ceil(amount),floor(amount) from income_record;

select floor(1+rand()*100)as random_number;

select sqrt(amount) from income_record;

select amount,amount*1.10 as Incremented_income
from income_record;

/* part D */
select curdate();

select now();

select year(start_date) from financial_year;

select month(start_date) from financial_year;

select day(start_date) from financial_year;

select date_add(start_date,interval 1 year )
from financial_year;


select date_add(start_date,interval 30 day )
from financial_year;

select date_add(start_date,interval 7 day )
from financial_year;

select datediff(curdate(),start_date)
from financial_year;

select * from financial_year
where year(start_date)=year(curdate());

/* part e */
select  cast(amount as signed)
from income_record;

 select cast(taxprayer_id as char)
 from taxpayer;
 
 select cast(start_date as datetime)
from financial_year;

select  cast(amount as decimal(10,2))
from income_record;

select  cast(amount as char)
from income_record;

select  cast(amount as  decimal(10,2) )* 0.10 as Tax 
from income_record;



 
 