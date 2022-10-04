 -- 1. Выведите информацию о регионах и количестве сотрудников в каждом регионе.
  select region_name, count (*)
  from employees e
  join departments d on (e.department_id = d.department_id)
  join locations l on (d.location_id = l.location_id)
  join countries c on (l.country_id = c.country_id)
  join regions r on (c.region_id = r.region_id)
  group by region_name;
  
 -- 2. Выведите детальную информацию о каждом сотруднике: имя, фамилия, название департамента, job_id, адрес, страна и регион.
 select First_name, Last_name, Department_name, Job_id, street_address, Country_name, Region_name
 from employees  e
 join departments d on (e.department_id = d.department_id)
 join locations l on (d.location_id = l.location_id)
 join countries c on (l.country_id = c.country_id)
 join regions r on (c.region_id = r.region_id);
 
 -- 3. Выведите информацию о имени менеджеров которые имеют в подчинении больше 6ти сотрудников, а также выведите количество
 -- сотрудников, которые им подчиняются.
 select man.first_name, count (*)
 from employees emp join employees man on (emp.manager_id = man.employee_id)
 group by man.first_name
 having count (*) > 6;
 
 -- 4. Выведите информацию о названии всех департаментов и о количестве работников, если в департаменте работают больше 30ти сотрудников.
 select department_name, count (*)
 from employees e join departments d on (e.department_id = d.department_id)
 group by department_name
 having count (*) > 30;
 
 -- 5. Выведите названия всех департаментов, в которых нет ни одного сотрудника.
 select department_name
 from employees  e
 right join departments d on (e.department_id = d.department_id)
 where first_name is null;
 
 -- 6. Выведите всю информацию о сотрудниках, менеджеры которых устроились на работу в 2005ом году, но при это сами работники 
  -- устроились на работу до 2005 года.
select emp.*
from employees emp join employees man on (emp.manager_id = man.employee_id)
where TO_CHAR (man.hire_date, 'YYYY') = '2005'
and emp.hire_date < TO_DATE ('01012005', 'DDMMYYYY');
       
 -- 7. Выведите название страны и название региона этой страны, используя natural join.
 
 -- 8. Выведите имена, фамилии и з/п сотрудников, которые получают меньше, чем (минимальная з/п по их специальности + 1000).
 
 -- 9. Выведите уникальные имена и фамилии сотрудников, названия стран, в которых они работают. Также выведите информацию о сотрудниках,
 -- о странах которых нет информации. А также выведите все страны, в которых нет сотрудников компании.
 
 -- 10.Выведите имена и фамилии всех сотрудников, а также названия стран, которые мы получаем при объединении работников со всеми
 -- странами без какой-либо логики.
