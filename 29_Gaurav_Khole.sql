
# Q.1. 

create table customers (
cust_id int(8) primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
phone int unique,
bill decimal(10,2) default 0
);


# Q.2.
insert into customers values
(1, "Sam","Huse", 4935352, 3463.24),
(2, "Roger", "Vandal", 3654232,6434.23),
(3, "Alex", "Hales", 4522542, 3733.63);

select * from customers;

# Q.3.

select employee_id, first_name, length(first_name) as len from employees
having len = 4;


# Q.4.

select sum(e.salary) as total_salary, d.department_name from employees as e
join departments as d on d.department_id = e.department_id
group by department_name;


# Q.5. 

select employee_id, department_id, concat(first_name, " ", last_name) as Full_Name, round((avg(salary)*12),2) as avg_sal from employees 
group by employee_id
having avg_sal > 75000;


# Q.6.

select count(city) as city_count, r.region_id, r.region_name  from locations as l
inner join countries as c on l.country_id = c.country_id
inner join regions as r on r.region_id = c.region_id
group by r.region_id
limit 1;

# Q.7.

delimiter $$
create procedure get_emp_details2(in emp_id int)
begin
	select concat(e.first_name, " ", e.last_name) as Full_Name, d.department_name, e.hire_date from employees as e
    inner join departments as d on d.department_id = e.department_id
    where employee_id = emp_id;
end; $$
delimiter ;

call get_emp_details2(100);
call get_emp_details2(140);

select * from employees;

#.Q.8.

delimiter $$
create function get_emp_exp_years3(emp_id int)
returns int
deterministic
begin
	declare total_years int;
    select (datediff(end_date,start_date)/365) into total_years from job_history
    where employee_id = emp_id;
    return total_years;
end; $$
delimiter ;

select get_emp_exp_years3(102);
select get_emp_exp_years3(114);

select * from job_history;


-- MONGO DB QUERY

#.Q.1. 
-- db.resturant.find({name:{$regex:/^P/}}); 

#.Q.2.
--  db.resturant.find({$or:[{cuisine:"Bakery"},{cuisine:"Chinese"}]});

#Q.3.
--  db.resturant.find({$or:[{"grades.grade":"A"},{"grades.score":{$gte:20}}]});
