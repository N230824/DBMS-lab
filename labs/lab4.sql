use taxation;
show tables;

/* part B */
select t.full_name
from taxpayer as t
inner join income_record as i
on t.taxprayer_id=i.taxpayer_id;

select t.full_name
from taxpayer as t
inner join income_record as ir
on t.taxprayer_id=ir.taxpayer_id
inner join income_category ic
on ir.category_id=ic.category_id;

select * from income_category;
select * from income_record;

update income_record
set category_id=1
where income_id=1001;

select ir.income_source,ir.amount,fy.year_label
from income_record ir
inner join financial_year fy
on ir.year_id=fy.year_id;

update income_record
set year_id=1
where income_id=1001;
   
select t.full_name,i.amount
from taxpayer as t
inner join income_record as i
on t.taxprayer_id=i.taxpayer_id;

select t.full_name,ir.income_source,ic.category_name,fy.year_label
from taxpayer as t
inner join income_record as ir
on t.taxprayer_id=ir.taxpayer_id
inner join income_category ic
on ir.category_id=ic.category_id
inner join financial_year fy
on ir.year_id=fy.year_id;

/* level 2 */
select t.full_name,ir.income_source,ic.category_name
from taxpayer as t
inner join income_record as ir
on t.taxprayer_id=ir.taxpayer_id
inner join income_category ic
on ir.category_id=ic.category_id
where ic.category_name='salary';

select t.full_name,ir.income_source,ic.category_name,t.occupation
from taxpayer as t
inner join income_record as ir
on t.taxprayer_id=ir.taxpayer_id
inner join income_category ic
on ir.category_id=ic.category_id
where ic.category_name='business';

select t.full_name,t.pan_number,t.occupation,fy.start_date,fy.end_date
from taxpayer as t
inner join income_record as ir
on t.taxprayer_id=ir.taxpayer_id
inner join financial_year fy
on ir.year_id=fy.year_id;

select t.full_name,t.pan_number,t.occupation,ic.category_name,ic.descriptions
from taxpayer as t
inner join income_record as ir
on t.taxprayer_id=ir.taxpayer_id
inner join income_category ic
on ir.category_id=ic.category_id;

select t.full_name,ir.income_source,ic.category_name,t.occupation,t.pan_number,fy.year_label,fy.start_date,fy.end_date
from taxpayer as t
inner join income_record as ir
on t.taxprayer_id=ir.taxpayer_id
inner join income_category ic
on ir.category_id=ic.category_id
inner join financial_year fy
on ir.year_id=fy.year_id;

/*level 3 */
select t.full_name,i.income_source,i.amount
from taxpayer as t
left join income_record as i
on t.taxprayer_id=i.taxpayer_id;

select ic.category_name,ir.income_source
from income_record ir
right outer join income_category ic
on ir.category_id=ic.category_id;

select t.full_name,i.income_source
from taxpayer as t
left join income_record as i
on t.taxprayer_id=i.taxpayer_id
 union
 select t.full_name,i.income_source
from taxpayer as t
right join income_record as i
on t.taxprayer_id=i.taxpayer_id;

select t.full_name,fy.year_label
from taxpayer t
cross join financial_year fy;

select t1.full_name as taxpayer1,t2.full_name as taxpayer2,t1.occupation
from taxpayer t1
inner join taxpayer t2
on t1.occupation=t2.occupation and t1.taxprayer_id < t2.taxprayer_id;





