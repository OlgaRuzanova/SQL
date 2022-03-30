 -- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select e.employee_name, s.monthly_salary 
from employee_salary e_s 
join employees e
on e.id = e_s.employee_id
join salary s
on s.id = e_s.salary_id ;

 -- 2. ������� ���� ���������� � ������� �� ������ 2000.
select e.employee_name, s.monthly_salary
from employee_salary e_s 
join employees e
on e.id = e_s.employee_id
join salary s
on s.id = e_s.salary_id 
where s.monthly_salary < 2000;

 -- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select s.monthly_salary, e_s.employee_id, e.employee_name
FROM salary s 
join employee_salary e_s 
on  s.id = e_s.salary_id 
left join employees e 
on e.id = e_s.employee_id
where employee_name isnull;

 -- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select s.monthly_salary, e_s.employee_id, e.employee_name
FROM salary s
join employee_salary e_s 
on  s.id = e_s.salary_id 
left join employees e 
on e.id = e_s.employee_id
where employee_name is null and monthly_salary < 2000;

 -- 5. ����� ���� ���������� ���� �� ��������� ��.
select e.employee_name, s.monthly_salary 
from employees e 
left join employee_salary e_s
on e.id = e_s. employee_id
left join salary s
on s.id = e_s.salary_id
where monthly_salary is null;

 -- 6. ������� ���� ���������� � ���������� �� ���������.
select e.employee_name, r.role_name  
from employees e
right join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id;

 -- 7. ������� ����� � ��������� ������ Java �������������.
select e.employee_name, r.role_name 
from employees e 
right join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Java_developer';

 -- 8. ������� ����� � ��������� ������ Python �������������.
select e.employee_name, r.role_name  
from employees e
join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Python%';

 -- 9. ������� ����� � ��������� ���� QA ���������.
select e.employee_name, r.role_name  
from employees e 
join roles_employee r_e 
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%QA%';

 -- 10. ������� ����� � ��������� ������ QA ���������.
select e.employee_name, r.role_name 
from employees e
join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Manual%';

 -- 11. ������� ����� � ��������� ��������������� QA
select e.employee_name, r.role_name 
from employees e
join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Automation%';

 -- 12. ������� ����� � �������� Junior ������������
select e.employee_name, s.monthly_salary, r.role_name
from employee_salary e_s 
join employees e
on e.id = e_s.employee_id
join salary s
on s.id = e_s.salary_id 
join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Junior%';

 -- 13. ������� ����� � �������� Middle ������������
select e.employee_name, s.monthly_salary, r.role_name
from employee_salary e_s 
join employees e 
on e.id = e_s.employee_id
join salary s
on s.id = e_s.salary_id 
join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Middle%';

 -- 14. ������� ����� � �������� Senior ������������
select e.employee_name, s.monthly_salary, r.role_name
from employee_salary e_s 
join employees e
on e.id = e_s.employee_id
join salary s
on s.id = e_s.salary_id 
join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Senior%';

 -- 15. ������� �������� Java �������������
select r.role_name, s.monthly_salary 
from roles r 
join roles_employee r_e
on r.id = r_e.role_id 
join employee_salary e_s
on r_e.employee_id = e_s.employee_id 
join salary s
on e_s.salary_id = s.id
where role_name like '%Java%';

 -- 16. ������� �������� Python �������������
select r.role_name, s.monthly_salary 
from roles r 
join roles_employee r_e 
on r.id = r_e.role_id 
join employee_salary e_s 
on r_e.employee_id = e_s.employee_id 
join salary s
on e_s.salary_id = s.id
where role_name like '%Python%';

 -- 17. ������� ����� � �������� Junior Python �������������
select e.employee_name, s.monthly_salary, r.role_name
from employee_salary e_s 
join employees e
on e.id = e_s.employee_id
join salary s
on s.id = e_s.salary_id 
join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Junior%' and role_name like '%Python%';

 -- 18. ������� ����� � �������� Middle JS �������������
select e.employee_name, s.monthly_salary, r.role_name
from employee_salary e_s 
join employees e
on e.id = e_s.employee_id
join salary s
on s.id = e_s.salary_id 
join roles_employee r_e 
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%JavaScript%';

 -- 19. ������� ����� � �������� Senior Java �������������
select e.employee_name, s.monthly_salary, r.role_name
from employee_salary e_s 
join employees e
on e.id = e_s.employee_id
join salary s
on s.id = e_s.salary_id 
join roles_employee r_e 
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Java%' and role_name like '%Senior%';

 -- 20. ������� �������� Junior QA ���������
select r.role_name, s.monthly_salary 
from roles r 
join roles_employee r_e 
on r.id = r_e.role_id 
join employee_salary e_s 
on r_e.employee_id = e_s.employee_id 
join salary s 
on e_s.salary_id = s.id
where role_name like '%QA%' and role_name like '%Junior%';

 --21. ������� ������� �������� ���� Junior ������������
select AVG(monthly_salary)  from salary s 
join employee_salary e_s 
on e_s.salary_id = s.id 
join roles_employee r_e 
on e_s.employee_id = r_e.employee_id 
join roles r
on r_e.role_id = r.id
WHERE role_name like '%Junior%';

 -- 22. ������� ����� ������� JS �������������
select SUM(monthly_salary)  from salary s 
join employee_salary e_s 
on e_s.salary_id = s.id 
join roles_employee r_e 
on e_s.employee_id = r_e.employee_id 
join roles r
on r_e.role_id = r.id
where role_name like '%JavaScript%';

 -- 23. ������� ����������� �� QA ���������
select MIN(monthly_salary) as m_salary_QA from salary s 
join employee_salary e_s 
on e_s.salary_id = s.id 
join roles_employee r_e 
on e_s.employee_id = r_e.employee_id 
join roles r
on r_e.role_id = r.id
where role_name like '%QA%';

 -- 24. ������� ������������ �� QA ���������
select MAX(monthly_salary) m_salary_QA from salary s 
join employee_salary e_s 
on e_s.salary_id = s.id 
join roles_employee r_e 
on e_s.employee_id = r_e.employee_id 
join roles r
on r_e.role_id = r.id
where role_name like '%QA%';

 -- 25. ������� ���������� QA ���������
select count(role_name) from roles 
join roles_employee
on roles.id = roles_employee.role_id 
where role_name like '%QA%';

 -- 26. ������� ���������� Middle ������������.
select count(role_name) from roles 
join roles_employee
on roles.id = roles_employee.role_id 
where role_name like '%Middle%';

 -- 27. ������� ���������� �������������
select count(role_name) from roles 
join roles_employee
on roles.id = roles_employee.role_id 
where role_name like '%developer%';

 -- 28. ������� ���� (�����) �������� �������������.
select SUM(monthly_salary) salary_dev from salary s 
join employee_salary e_s 
on e_s.salary_id = s.id 
join roles_employee r_e 
on e_s.employee_id = r_e.employee_id 
join roles r
on r_e.role_id = r.id
where role_name like '%developer%';

 -- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
select e.employee_name, r.role_name, s.monthly_salary from employees e 
join roles_employee r_e 
on e.id = r_e.role_id 
join roles r
on r_e.role_id = r.id 
join employee_salary e_s 
on r_e.employee_id = e_s.employee_id 
join salary s
on e_s.salary_id = s.id 
order by s.monthly_salary;

 -- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select e.employee_name, r.role_name, s.monthly_salary from employees e 
join roles_employee r_e 
on e.id = r_e.role_id 
join roles r
on r_e.role_id = r.id 
join employee_salary e_s 
on r_e.employee_id = e_s.employee_id 
join salary s
on e_s.salary_id = s.id 
where s.monthly_salary between 1700 and 2300
order by s.monthly_salary;

 -- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select e.employee_name, r.role_name, s.monthly_salary from employees e 
join roles_employee r_e 
on e.id = r_e.role_id 
join roles r
on r_e.role_id = r.id 
join employee_salary e_s 
on r_e.employee_id = e_s.employee_id 
join salary s
on e_s.salary_id = s.id 
where s.monthly_salary < 2300
order by s.monthly_salary;

 -- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select e.employee_name, r.role_name, s.monthly_salary 
from employees e 
join roles_employee r_e
on e.id = r_e.role_id 
join roles r
on r_e.role_id = r.id 
join employee_salary e_s 
on r_e.employee_id = e_s.employee_id 
join salary s
on e_s.salary_id = s.id 
where s.monthly_salary in (1100, 1500, 2000)
order by s.monthly_salary;