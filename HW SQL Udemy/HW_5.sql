 -- 1.Используя функции, получите список всех сотрудников у которых в имени есть буква 'b' (без учета регистра).
 SELECT *
 from hr.employees
 WHERE INSTR (LOWER (first_name), 'b') > 0;
 
  -- 2. Используя функции, получите список всех сотрудников, у которых в имени содержатся минимум 2 буквы 'a'.
 SELECT *
 from hr.employees
 WHERE INSTR (LOWER (first_name),'a',1,2) > 0;

 -- 3. Получите первое слово из имени департамента, для тех департаментов, у которых название состоит больше, чем из одного слова.
 SELECT department_name,
 SUBSTR (department_name, 1, INSTR (department_name, ' ')-1)
 first_word
 from hr.departments
 WHERE INSTR (department_name, ' ') > 0;
 
 -- 4. Получите имена сотрудников без первой и последней буквы в имени.
 SELECT first_name, SUBSTR (first_name, 2, LENGTH (first_name) - 2) new_name
 from hr.employees;

 -- 5. Получите список всех сотрудников, у которых в значении job_id после знака '_' как минимум 3 символа, но при этом это значение после '_' не равно 'CLERK'.
 SELECT *
 from hr.employees
 WHERE     LENGTH (SUBSTR (job_id, INSTR (job_id, '_') + 1)) > 3
 AND SUBSTR (job_id, INSTR (job_id, '_') + 1) != 'CLERK';

 -- 6. Получите список всех сотрудников, которые пришли на работу в первый день любого месяца.
 SELECT *
 from hr.employees
 WHERE TO_CHAR (hire_date, 'DD') = '01';
 
 -- 7. Получите список всех сотрудников, которые пришли на работу в 2008ом году.
 SELECT *
 FROM hr.employees
 from TO_CHAR (hire_date, 'YYYY') = '2008';
 
 -- 8. Покажите завтрашнюю дату в формате: Tomorrow is Second day of January
 SELECT TO_CHAR (SYSDATE, 'fm""Tomorrow is ""Ddspth ""day of"" Month') tomorrow_date
 from DUAL;
  
 -- 9. Выведите имя сотрудника и дату его прихода на работу в формате: 21st of June, 2007
 SELECT first_name, TO_CHAR (hire_date, 'fmddth ""of"" Month, YYYY') hire_date
 from hr.employees;
 
 -- 10.Получите список работников с увеличенными зарплатами на 20%. Зарплату показать в формате: $28,800.00
 SELECT first_name, TO_CHAR (salary + salary * 0.20, 'fm$999,999.00') new_salary
 from hr.employees;
 
 -- 11.Выведите имя сотрудника, его комиссионные, а также информацию о наличии бонусов к зарплате – есть ли у него комиссионные (Yes/No).
 SELECT FIRST_NAME, COMMISSION_PCT, NVL2(COMMISSION_PCT, 'YES', 'NO') bonuses
 from hr.employees;

 -- 12.Для каждой страны показать регион, в котором она находится: 1- Europe, 2-America, 3-Asia, 4-Africa . Выполнить данное задание, не используя функционал JOIN. Используйте DECODE.
 select country_name,
 DECODE(REGION_ID, 
 1, 'Europe',
 2, 'America',
 3, 'Asia',
 4, 'Africa',
'Unknown')
from hr.countries;

 -- 13.Задачу №12 решите используя CASE.
 Select country_name,
 CASE REGION_ID
 WHEN 1 THEN 'Europe'
 WHEN 2 THEN 'America'
 WHEN 3 THEN 'Asia'
 WHEN 4 THEN 'Africa'
 ELSE ‘Unknown’
 END
 REGION
 from hr.countries;

 -- 14.Выведите имя сотрудника, его з/п, а также уровень того, насколько у сотрудника хорошие условия :
 -- • BAD: з/п меньше 10000 и отсутствие комиссионных;
 -- • NORMAL: з/п между 10000 и 15000 или, если присутствуют комиссионные;
 -- • GOOD: з/п больше или равна 15000.
 SELECT FIRST_NAME, SALARY,
 CASE
 WHEN SALARY < 10000 AND COMMISSION_PCT = 0 THEN 'BAD'
 WHEN SALARY BETWEEN 10000 AND 15000 OR COMMISSION_PCT > 0 THEN 'NORMAL'
 WHEN SALARY >= 15000 THEN 'GOOD' 
 END
 conditions
 from hr.employees;