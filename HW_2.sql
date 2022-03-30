-- 1. ������� employees
-- ������� ������� employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees (
id serial primary key,
employee_name Varchar(50) not null
);

--��������� ������� employee 70 ��������.
insert into employees(employee_name)
values ('The names');


-- ������� salary
-- ������� ������� salary
-- - id. Serial  primary key,
-- - monthly_salary. Int, not null

create table salary (
id serial  primary key,
monthly_salary int not null
)

-- ��������� ������� salary 15 ��������(1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2300,2400,2500)

insert into salary(monthly_salary)
values (1000);
    
	
 -- ������� employee_salary
 -- ������� ������� employee_salary
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique
-- - salary_id. Int, not null
      
 create table employee_salary (
 id serial primary key,
 employee_id int not null unique,
 salary_id int not null
 );

-- ��������� ������� employee_salary 40 ��������:
-- - � 10 ����� �� 40 �������� �������������� employee_id
insert into employee_salary(id,employee_id,salary_id)
values (1,1,1);
  
  
--������� roles
-- ������� ������� roles
-- - id. Serial  primary key,
-- - role_name. int, not null, unique

create table roles(
id serial primary key,
role_name int not null unique
);

-- �������� ��� ������ role_name � int �� varchar(30)
ALTER TABLE roles
ALTER COLUMN role_name type VARCHAR(30);

-- ��������� ������� roles 20 ��������:
insert into roles(role_name)
values ('Junior_Python_developer');
   
   
-- ������� roles_employee
-- ������� ������� roles_employee
-- - id. Serial  primary key,
-- - employee_id. Int, not null, unique (������� ���� ��� ������� employees, ���� id)
-- - role_id. Int, not null (������� ���� ��� ������� roles, ���� id)

create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
references employees(id),
foreign key (role_id)
references roles(id)
);

-- ��������� ������� roles_employee 40 ��������:
insert into roles_employee (employee_id,role_id)
values (1,1);
     