  -- 1. Получить репорт по department_id с минимальной и максимальной зарплатой, с самой ранней и самой поздней датой прихода на работу и
 -- с количеством сотрудников. Сортировать по количеству сотрудников(по убыванию).
 select department_id,
 MIN (salary) min_salary,
 MAX (salary) max_salary,
 MIN (hire_date) min_hire_date,
 MAX (hire_date) max_hire_Date,
 count (*) count
 from hr.employees
 group by department_id
 order by count(*) desc;

	-- 2. Выведите информацию о первой букве имени сотрудника и количество имён, которые начинаются с этой буквы. Выводить строки для букв, где
 -- количество имён, начинающихся с неё больше 1. Сортировать по количеству.
 select substr (first_name, 1, 1) first_char, count (*)
 from hr.employees
 group by substr (first_name, 1, 1)
 having count (*) > 1
 order by 2 desc;
 
 -- 3. Выведите id департамента, з/п и количество сотрудников, которые работают в одном и том же департаменте и получают одинаковую зарплату.
 select department_id, salary, count (*)
 from hr.employees
 group by department_id, salary
 having count (*) > 1;
  
 -- 4. Выведите день недели и количество сотрудников, которых приняли на работу в этот день.
 select to_char (hire_Date, 'Day') day, count (*)
 from hr.employees
 group by to_char (hire_Date, 'Day');
 
 -- 5. Выведите id департаментов, в которых работает больше 30 сотрудников и сумма их з/п-т больше 300000.
 select department_id, count(*), sum(salary) 
 from hr.employees 
 group by department_id 
 having count(*) > 30 and sum(salary) > 300000;
 
 -- 6. Из таблицы countries вывести все region_id, для которых сумма всех букв их стран больше 50ти.
 select region_id, count(*) 
 from hr.countries 
 group by region_id 
 having sum(length(country_name)) > 50;
 
 -- 7. Выведите информацию о job_id и округленную среднюю зарплату работников для каждого job_id.
 select job_id, round (avg (salary)) avg_salary
 from hr.employees
 group by job_id;

 -- 8. Получить список id департаментов, в которых работают сотрудники нескольких (>1) job_id.
 select department_id
 from hr.employees
 group by department_id
 having count (distinct job_id) > 1;
 
 -- 9. Выведите информацию о department, job_id, максимальную и минимальную з/п для всех сочетаний department_id - job_id, 
  -- где средняя з/п больше 10000.
  select department_id, job_id, max(salary), min(salary), count(*) 
  from hr.employees 
  group by department_id, job_id 
  having avg(salary) > 10000;
  
 -- 10.Получить список manager_id, у которых средняя зарплата всех его подчиненных, не имеющих комиссионные, находится в промежутке от 6000 до 9000.
 select manager_id, avg(salary) 
 from hr.employees 
 where commission_pct is null 
 group by manager_id 
 having (avg(salary) > 6000 and avg(salary) < 9000);
 
 -- 11.Выведите округлённую до тысяч (не тысячных) максимальную зарплату среди всех средних зарплат по департаментам.
 select round(max (avg (salary)), -3)
 from hr.employees
 group by department_id;