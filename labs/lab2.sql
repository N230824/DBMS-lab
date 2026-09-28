use taxation;
show tables;

alter table income_record
drop column category_name;
alter table income_record
drop column financial_year;
alter table income_record
add category_id int;
alter table income_record
add year_id int;

desc income_record;
alter table income_record
add constraint fk_taxpayer
foreign key(taxpayer_id)
references taxpayer(taxpayer_id);
desc taxpayer;
alter table income_record
add constraint fk_category
foreign key(category_id)
references income_category(category_id);

update income_record
set category_id =2
where taxpayer_id =103;

update income_record
set category_id =2
where taxpayer_id =105;

update income_record
set category_id =3
where taxpayer_id =106;

update income_record
set category_id =4
where taxpayer_id =102;

update income_record
set category_id =1
where taxpayer_id =104;

alter table income_record
add constraint fk_year
foreign key(year_id)
references financial_year(year_id);

update income_record
set year_id=2
where taxpayer_id=102;

update income_record
set year_id=3
where taxpayer_id=103;

update income_record
set year_id=4
where taxpayer_id=104;

update income_record
set year_id=6
where taxpayer_id=105;


show create table income_record;
insert into income_record(income_id,taxpayer_id,income_source,amount,received_date,category_id,year_id) values(2001,999,'salary',50000,'2025-06-01',1,1);
desc income_record;
alter table income_record
add category_id int,
add year_id int;

desc income_record;

/*  0	26	16:08:09	insert into income_record(income_id,taxpayer_id,income_source,amount,received_date,category_id,year_id) values(2001,999,'salary',50000,'2025-06-01',1,1)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`lab db1`.`income_record`, CONSTRAINT `fk_taxpayer` FOREIGN KEY (`taxpayer_id`) REFERENCES `taxpayer` (`taxpayer_id`))	0.016 sec*/
insert into income_record(income_id,taxpayer_id,income_source,amount,received_date,category_id,year_id) values(2001,1,'salary',600000,'2025-06-01',20,1);
/*  0	26	16:08:09	insert into income_record(income_id,taxpayer_id,income_source,amount,received_date,category_id,year_id) values(2001,999,'salary',50000,'2025-06-01',1,1)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`lab db1`.`income_record`, CONSTRAINT `fk_taxpayer` FOREIGN KEY (`taxpayer_id`) REFERENCES `taxpayer` (`taxpayer_id`))	0.016 sec*/
insert into income_record(income_id,taxpayer_id,income_source,amount,received_date,category_id,year_id) values(2003,1,'salary',70000,'2025-06-01',1,15);
select * from taxpayer;

delete from taxpayer
where taxpayer_id=101;

select * from income_category;
select distinct category_id
from income_record;

update income_record
set category_id=1,
year_id=1
where income_id =1001;
select * from income_record;

delete from income_category
where category_id=1;
/* part c */
select distinct occupation
from taxpayer;

select distinct category_name
from income_category;

select distinct financial_year
from year_id;

select distinct income_source
from income_record;

/* part D */
select t.full_name
from taxpayer t
join income_record ir
on t.taxpayer_id=ir.taxpayer_id
join income_category ic
on ir.category_id=ic.category_id
where ic.category_name='Salary'
union
select t.full_name
from taxpayer t
join income_record ir
on t.taxpayer_id=ir.taxpayer_id
join income_category ic
on ir.category_id=ic.category_id
where ic.category_name='Business';

SELECT ir.income_source
FROM Income_Record ir
JOIN Financial_Year fy ON ir.year_id = fy.year_id
WHERE fy.year_label = '2024-2025'

UNION

SELECT income_source
FROM Income_Record ir
JOIN Financial_Year fy ON ir.year_id = fy.year_id
WHERE fy.year_label = '2025-2026';

SELECT full_name
FROM Taxpayer
WHERE occupation = 'Teacher'

UNION

SELECT full_name
FROM Taxpayer
WHERE occupation = 'Software Engineer';

/*part e */
select t.full_name
from taxpayer t
join income_record ir
on t.taxpayer_id=ir.taxpayer_id
join income_category ic
on ir.category_id=ic.category_id
where ic.category_name in
('Salary','Business')
group by t.taxpayer_id,t.full_name
having count(distinct ic.category_name)=2;
/*intersect
select t.full_name
from taxpayer t
join income_record ir
on t.taxpayer_id=ir.taxpayer_id
join income_category ic
on ir.category_id=ic.category_id
where ic.category_name='Business';*/
SELECT t.full_name
FROM Taxpayer t
JOIN Income_Record ir ON t.taxpayer_id = ir.taxpayer_id
JOIN Financial_Year fy ON ir.year_id = fy.year_id
WHERE fy.year_label IN ('2024-2025', '2025-2026')
GROUP BY t.taxpayer_id, t.full_name
HAVING COUNT(DISTINCT fy.year_label) = 2;

/*part f */
SELECT DISTINCT t.full_name
FROM Taxpayer t
JOIN Income_Record ir ON t.taxpayer_id = ir.taxpayer_id
JOIN Income_Category ic ON ir.category_id = ic.category_id
WHERE ic.category_name = 'Salary'
AND t.taxpayer_id NOT IN (
    SELECT ir.taxpayer_id
    FROM Income_Record ir
    JOIN Income_Category ic ON ir.category_id = ic.category_id
    WHERE ic.category_name = 'Business'
);


SELECT DISTINCT t.full_name
FROM Taxpayer t
JOIN Income_Record ir ON t.taxpayer_id = ir.taxpayer_id
JOIN Financial_Year fy ON ir.year_id = fy.year_id
WHERE fy.year_label = '2025-2026'
AND t.taxpayer_id NOT IN (
    SELECT ir.taxpayer_id
    FROM Income_Record ir
    JOIN Financial_Year fy ON ir.year_id = fy.year_id
    WHERE fy.year_label = '2024-2025'
);

/* part g */
select full_name
from taxpayer 
where taxpayer_id in(select taxpayer_id
from income_record);

SELECT full_name
FROM Taxpayer
WHERE occupation IN (
    SELECT DISTINCT t.occupation
    FROM Taxpayer t
    JOIN Income_Record ir ON t.taxpayer_id = ir.taxpayer_id
    JOIN Income_Category ic ON ir.category_id = ic.category_id
    WHERE ic.category_name = 'Business'
);

/*part h*/
select full_name
from taxpayer 
where taxpayer_id  not in(select taxpayer_id
from income_record);

SELECT DISTINCT occupation
FROM Taxpayer
WHERE occupation NOT IN (
    SELECT DISTINCT t.occupation
    FROM Taxpayer t
    JOIN Income_Record ir ON t.taxpayer_id = ir.taxpayer_id
);

/*part i */
SELECT full_name
FROM Taxpayer t
WHERE EXISTS (
    SELECT *
    FROM Income_Record ir
    WHERE ir.taxpayer_id = t.taxpayer_id
);

 /* part j */
 SELECT year_label
FROM Financial_Year fy
WHERE EXISTS (
    SELECT *
    FROM Income_Record ir
    WHERE ir.year_id = fy.year_id
);


/* part k */
 SELECT full_name, annual_income
FROM Taxpayer
WHERE annual_income > ANY (
    SELECT annual_income
    FROM Taxpayer
    WHERE occupation = 'Teacher'
);

SELECT full_name, annual_income
FROM Taxpayer
WHERE annual_income > ANY (
    SELECT ir.amount
    FROM Income_Record ir
    JOIN Income_Category ic
    ON ir.category_id = ic.category_id
    WHERE ic.category_name = 'Business'
);
/* part L */
SELECT full_name, annual_income
FROM Taxpayer
WHERE annual_income > ALL (
    SELECT annual_income
    FROM Taxpayer
    WHERE occupation = 'Teacher'
);



SELECT full_name, annual_income
FROM Taxpayer
WHERE annual_income > all(
    SELECT ir.amount
    FROM Income_Record ir
    JOIN Income_Category ic
    ON ir.category_id = ic.category_id
    WHERE ic.category_name = 'Business'
); 
 

