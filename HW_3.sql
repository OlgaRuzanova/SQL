 -- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select e.employee_name, s.monthly_salary 
from employee_salary e_s 
join employees e
on e.id = e_s.employee_id
join salary s
on s.id = e_s.salary_id ;

 -- 2. Вывести всех работников у которых ЗП меньше 2000.
select e.employee_name, s.monthly_salary
from employee_salary e_s 
join employees e
on e.id = e_s.employee_id
join salary s
on s.id = e_s.salary_id 
where s.monthly_salary < 2000;

 -- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.monthly_salary, e_s.employee_id, e.employee_name
FROM salary s 
join employee_salary e_s 
on  s.id = e_s.salary_id 
left join employees e 
on e.id = e_s.employee_id
where employee_name isnull;

 -- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select s.monthly_salary, e_s.employee_id, e.employee_name
FROM salary s
join employee_salary e_s 
on  s.id = e_s.salary_id 
left join employees e 
on e.id = e_s.employee_id
where employee_name is null and monthly_salary < 2000;

 -- 5. Найти всех работников кому не начислена ЗП.
select e.employee_name, s.monthly_salary 
from employees e 
left join employee_salary e_s
on e.id = e_s. employee_id
left join salary s
on s.id = e_s.salary_id
where monthly_salary is null;

 -- 6. Вывести всех работников с названиями их должности.
select e.employee_name, r.role_name  
from employees e
right join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id;

 -- 7. Вывести имена и должность только Java разработчиков.
select e.employee_name, r.role_name 
from employees e 
right join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Java_developer';

 -- 8. Вывести имена и должность только Python разработчиков.
select e.employee_name, r.role_name  
from employees e
join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Python%';

 -- 9. Вывести имена и должность всех QA инженеров.
select e.employee_name, r.role_name  
from employees e 
join roles_employee r_e 
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%QA%';

 -- 10. Вывести имена и должность ручных QA инженеров.
select e.employee_name, r.role_name 
from employees e
join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Manual%';

 -- 11. Вывести имена и должность автоматизаторов QA
select e.employee_name, r.role_name 
from employees e
join roles_employee r_e
on e.id = r_e.employee_id 
join roles r
on r.id = r_e.role_id
where role_name like '%Automation%';

 -- 12. Вывести имена и зарплаты Junior специалистов
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

 -- 13. Вывести имена и зарплаты Middle специалистов
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

 -- 14. Вывести имена и зарплаты Senior специалистов
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

 -- 15. Вывести зарплаты Java разработчиков
select r.role_name, s.monthly_salary 
from roles r 
join roles_employee r_e
on r.id = r_e.role_id 
join employee_salary e_s
on r_e.employee_id = e_s.employee_id 
join salary s
on e_s.salary_id = s.id
where role_name like '%Java%';

 -- 16. Вывести зарплаты Python разработчиков
select r.role_name, s.monthly_salary 
from roles r 
join roles_employee r_e 
on r.id = r_e.role_id 
join employee_salary e_s 
on r_e.employee_id = e_s.employee_id 
join salary s
on e_s.salary_id = s.id
where role_name like '%Python%';

 -- 17. Вывести имена и зарплаты Junior Python разработчиков
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

 -- 18. Вывести имена и зарплаты Middle JS разработчиков
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

 -- 19. Вывести имена и зарплаты Senior Java разработчиков
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

 -- 20. Вывести зарплаты Junior QA инженеров
select r.role_name, s.monthly_salary 
from roles r 
join roles_employee r_e 
on r.id = r_e.role_id 
join employee_salary e_s 
on r_e.employee_id = e_s.employee_id 
join salary s 
on e_s.salary_id = s.id
where role_name like '%QA%' and role_name like '%Junior%';

 --21. Вывести среднюю зарплату всех Junior специалистов
select AVG(monthly_salary)  from salary s 
join employee_salary e_s 
on e_s.salary_id = s.id 
join roles_employee r_e 
on e_s.employee_id = r_e.employee_id 
join roles r
on r_e.role_id = r.id
WHERE role_name like '%Junior%';

 -- 22. Вывести сумму зарплат JS разработчиков
select SUM(monthly_salary)  from salary s 
join employee_salary e_s 
on e_s.salary_id = s.id 
join roles_employee r_e 
on e_s.employee_id = r_e.employee_id 
join roles r
on r_e.role_id = r.id
where role_name like '%JavaScript%';

 -- 23. Вывести минимальную ЗП QA инженеров
select MIN(monthly_salary) as m_salary_QA from salary s 
join employee_salary e_s 
on e_s.salary_id = s.id 
join roles_employee r_e 
on e_s.employee_id = r_e.employee_id 
join roles r
on r_e.role_id = r.id
where role_name like '%QA%';

 -- 24. Вывести максимальную ЗП QA инженеров
select MAX(monthly_salary) m_salary_QA from salary s 
join employee_salary e_s 
on e_s.salary_id = s.id 
join roles_employee r_e 
on e_s.employee_id = r_e.employee_id 
join roles r
on r_e.role_id = r.id
where role_name like '%QA%';

 -- 25. Вывести количество QA инженеров
select count(role_name) from roles 
join roles_employee
on roles.id = roles_employee.role_id 
where role_name like '%QA%';

 -- 26. Вывести количество Middle специалистов.
select count(role_name) from roles 
join roles_employee
on roles.id = roles_employee.role_id 
where role_name like '%Middle%';

 -- 27. Вывести количество разработчиков
select count(role_name) from roles 
join roles_employee
on roles.id = roles_employee.role_id 
where role_name like '%developer%';

 -- 28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(monthly_salary) salary_dev from salary s 
join employee_salary e_s 
on e_s.salary_id = s.id 
join roles_employee r_e 
on e_s.employee_id = r_e.employee_id 
join roles r
on r_e.role_id = r.id
where role_name like '%developer%';

 -- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
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

 -- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
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

 -- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
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

 -- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
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
