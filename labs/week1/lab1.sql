create database taxation;
/*---use database--*/
use taxation;
create table taxpayer(
taxprayer_id int primary key not null,
pan_number varchar(10) not null unique,
full_name varchar(100) not null,
date_of_birth date not null,
occupation varchar(50) not null,
annual_income decimal(12,2) not null,
email varchar(100) unique,
is_active boolean
);
show tables; 
alter table taxpayer
rename column taxprayer_id to taxpayer_id;

select * from taxpayer;
insert into taxpayer values(101,"ABCDE1234F","Ravi kumar",'1995-06-15',"software engineer",850000.00,"ravi.kumar@example.com",TRUE);
insert into taxpayer values(102,"BCDEF2345G","priya sharma",'1992-11-22',"doctor",120000.00,"priyasharma@example.com",TRUE);
insert into taxpayer values(103,"CDEG3456H","arjun reddy",'1988-03-10',"bussiness owner",180000.00,"arjun.reddy@example.com",TRUE);
insert into taxpayer values(104,"DEFGH4567J","sneha patel",'1998-08-05',"teacher",620000.00,"sneha.patel@example.com",TRUE);
insert into taxpayer values(105,"EFGHJ5678K","kiran rao",'1990-01-18',"freelancer",750000.00,"kiran.rao@example.com",TRUE);
insert into taxpayer values(106,"FGHJK6789L","meera singh",'1985-12-30',"consultant",150000.00,"meera.singh@example.com",TRUE);
show tables;
select * from taxpayer;
create table income_category(
category_id int primary key,
category_name varchar(50) not null unique,
descriptions varchar(200) not null,
taxable boolean not null);
show tables;
insert into income_category values(1,"salary","income received from employment",TRUE);
insert into income_category values(2,"business","income earned from business activities",TRUE);
insert into income_category values(3,"house property","income received from property or rent",TRUE);
insert into income_category values(4,"capital gains","income from tranfer of eligible assets",TRUE);
insert into income_category values(5,"other sources","income such as bank interest",TRUE);
insert into income_category values(6,"agricultural home","income from eligible agriculture activities",TRUE);
select * from income_category;
select * from taxpayer;
CREATE TABLE financial_year (
    year_id INT PRIMARY KEY NOT NULL,
    year_label VARCHAR(9) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    filing_deadline DATE,
    is_current BOOLEAN NOT NULL
);
INSERT INTO financial_year
VALUES
(1, '2020-2021', '2020-04-01', '2021-03-31', '2021-07-31', FALSE),
(2, '2021-2022', '2021-04-01', '2022-03-31', '2022-07-31', FALSE),
(3, '2022-2023', '2022-04-01', '2023-03-31', '2023-07-31', FALSE),
(4, '2023-2024', '2023-04-01', '2024-03-31', '2024-07-31', FALSE),
(5, '2024-2025', '2024-04-01', '2025-03-31', '2025-07-31', FALSE),
(6, '2025-2026', '2025-04-01', '2026-03-31', '2026-07-31', TRUE);
select * from financial_year;
CREATE TABLE income_record (
    income_id INT PRIMARY KEY,
    taxpayer_id INT NOT NULL,
    income_source VARCHAR(100) NOT NULL,
    category_name VARCHAR(50) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    received_date DATE NOT NULL,
    financial_year VARCHAR(9) NOT NULL
);
INSERT INTO income_record
VALUES
(1001, 101, 'TechNova Solutions', 'Salary', 850000.00, '2026-03-31', '2025-2026'),

(1002, 102, 'City Care Hospital', 'Salary', 1200000.00, '2026-03-31', '2025-2026'),

(1003, 103, 'Reddy Enterprises', 'Business', 1800000.00, '2026-03-31', '2025-2026'),

(1004, 104, 'Sunrise School', 'Salary', 620000.00, '2026-03-31', '2025-2026'),

(1005, 105, 'Web Design Projects', 'Business', 750000.00, '2026-03-31', '2025-2026'),

(1006, 106, 'Professional Consulting', 'Business', 1500000.00, '2026-03-31', '2025-2026');

select * from income_record;

insert into taxpayer values(107,"ABCDEF","Jayasri",'2007-03-15',"student","0.0000","jayasri@example.com",TRUE);
select * from taxpayer;

update taxpayer
set annual_income = "95000.0"
where taxprayer_id=101;
update taxpayer
set occupation="software consultant"
where taxprayer_id=105;
update taxpayer
set is_active=TRUE
where taxprayer_id=106;
delete from taxpayer
where taxprayer_id=107;
insert into income_category values(7,"rental income","income from eligible employment  activities",TRUE);


alter table taxpayer
add phone_number int;
alter table income_record
add remarks varchar(50);
alter table taxpayer
modify occupation varchar(100);

create table tax_office(
office_id int primary key,
office_name varchar(100) not null ,
city varchar(50) not null);
insert into tax_office values(101,"infosys","vizag"),
(102,"tcs","hyderabad");
show tables;
select * from tax_office;
truncate table tax_office;
drop table tax_office;
insert into taxpayer values(101,"ABCDE125F","Ravii kumar",'1995-06-15',"software engineer",850000.00,"ravi.kumar@example.com",TRUE, null);
/*	Error Code: 1062. Duplicate entry '101' for key 'taxpayer.PRIMARY'	0.047 sec*/
insert into taxpayer values(108,"ABCDE1234F","Ravii kumar",'1995-06-15',"software engineer",850000.00,"ravi.kumar@example.com",TRUE, null);
/*	Error Code: 1062. Duplicate entry '101' for key 'taxpayer.pan_number'	0.047 sec*/
insert into taxpayer values(108,"ABDE1234F",null,'1995-06-15',"software engineer",850000.00,"ravi.kumar@example.com",TRUE, null);
/*	Error Code: 1048. Column 'full_name' cannot be null	0.000 sec */



