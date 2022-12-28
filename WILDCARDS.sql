select * from address where userid = 1;

SELECT tablename FROM pg_catalog.pg_tables WHERE 
schemaname = 'public';

WILDCARDS

--POSTGRESQL WILDCARDS---

select * from users;

--Select name, phoneNumber, userid from users table where name starts with the letter "E".
Select user_name, phoneNumber, userid from users where user_name like 'E%'

--Select name, phoneNumber, userid from users table where name ends with the letter "a".
Select user_name, phoneNumber, userid from users where user_name like '%a';

--Select name, phoneNumber, userid from users table where name contains the letter "f".
Select user_name, phoneNumber, userid from users where user_name like '%f%';

--Select name, phoneNumber, userid from users table where name starts with letter "G" and ends with the letter "e".
Select user_name, phoneNumber, userid from users where user_name like 'G%e';

--Select name, phoneNuSELECT tablename FROM pg_catalog.pg_tables WHERE 
schemaname = 'public';select * from address where userid = 1;Select user_name, phoneNumber, userid from users where user_name not similar to '[ACSTGHR]%';select * from addressmber, userid from users table where name does NOT start with letters A,C,S,T,G,H,R.
Select user_name, phoneNumber, userid from users where user_name not similar to '[ACSTGHR]%';

--Select userid,name,city from address table where the second letter of the City is an "a".
 select userid,name,city from address where city like '_a%';

--Select userid,name,phoneNumber where the last letters of the name are "re".
select userid, name,phoneNumber from users where name like '%re';

--Select userid,city where where the 3rd letter of the City is a "b".
select userid,city from address where city like '__b%';

--Select userid,city where the first letter of the City is an "a" or an "s".
Select userid,city from address where city similar  to '[AS]%';

--Select userid,city where the first letter of the City starts with anything from an "a" to "c".
Select userid,city from address where city similar to '[A-C]%';


--Using the underscore (_) operator

select * from payment;

--select all records from payment table where the ordernumber starts with 5
select * from payment where ordernumber::text similar to '5_______'

--select all records from payment table where the ordernumber ends with 31
select * from payment where ordernumber::text similar to '______31'
