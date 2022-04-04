-- 1. Получите описание таблицы REGIONS, используя её полное имя.
DESCRIBE hr.regions; 

-- 2. Получите описание таблицы COUNTRIES, используя её полное имя.
DESC hr.countries;

-- 3. Получите описание таблицы JOBS, используя её короткое имя.
DESCRIBE jobs; 

-- 4. Получите описание таблицы LOCATIONS, используя её короткое имя.
DESC locations;

-- 5. Выведите всю информацию о регионах.
SELECT * from hr.regions;

-- 6. Выведите информацию о имени, id департамента, зарплате и фамилии для всех работников.
SELECT FIRST_NAME,  DEPARTMENT_ID, SALARY, LAST_NAME from hr.employees;

-- 7. Выведите информацию о id работника, электронной почте и дату, которая была за неделю до трудоустройства для всех работников.
-- Столбец, который будет содержать дату назовите One week before hire date .
SELECT EMPLOYEE_ID, EMAIL, HIRE_DATE - 7 "One week before hire date"
from hr.employees;

-- 8. Выведите информацию о работниках с их позициями в формате: Donald(SH_CLERK) . Назовите столбец our_employees .
SELECT FIRST_NAME || '(' || JOB_ID  || ')' our_employees from hr.employees;

-- 9. Выведите список уникальных имён среди работников.
SELECT DISTINCT FIRST_NAME from hr.employees;

-- 10. Выведите следующую информацию из таблицы jobs:
-- • job_title,
-- • выражение в формате: «min = 20080, max = 40000», где 20080 – это минимальная з/п, а 40000 – максимальная. Назовите этот столбец info.
-- • максимальную з/п и назовите столбец max,
-- • новую з/п, которая будет называться new_salary и вычисляться по формуле: max_salary*2-2000.
SELECT JOB_TITLE, 'min = ' || MIN_SALARY ||', max = ' || MAX_SALARY info,
MAX_SALARY max, MAX_SALARY *2 -2000 NEW_SALARY  from hr.jobs ;

-- 11. Выведите на экран предложение «Peter's dog is very clever», используя одну из двух техник работы с одинарными кавычками.
SELECT 'Peter"s dog is very clever' from dual;

-- 12. Выведите на экран предложение «Peter's dog is very clever», используя, отличную от предыдущего примера, технику работы с одинарными кавычками.
SELECT q' <Peter"s dog is very clever>' from dual;

-- 13. Выведите на экран количество минут в одном веке (1 год = 365.25 дней).
SELECT 100 * 365.25 * 24 * 60 from dual;


