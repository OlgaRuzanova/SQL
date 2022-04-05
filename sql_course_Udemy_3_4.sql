 -- 1.	Получите список всех сотрудников с именем David.
SELECT * from hr.employees
WHERE first_name = 'David';

 -- 2.	Получите список всех сотрудников, у которых job_id равен FI_ACCOUNT.
SELECT * from hr.employees
WHERE job_id = 'FI_ACCOUNT';

 -- 3. Выведите информацию о имени, фамилии, з/п и номере департамента 
для сотрудников из 50го департамента с зарплатой, большей 4000.
SELECT first_name, last_name, salary, department_id
from hr.employees
WHERE department_id =50 AND salary > 4000;

 -- 4. Получите список всех сотрудников, которые работают или в 20м, или в 
30м департаменте.
SELECT *
from hr.employees
WHERE department_id = 20 OR department_id = 30;

 -- 5. Получите список всех сотрудников, у которых вторая и последняя буква 
в имени равна 'a'.
SELECT *
from hr.employees
WHERE first_name LIKE '_a%a';

 -- 6. Получите список всех сотрудников из 50го и из 80го департамента, у 
которых есть бонус(комиссионные). Отсортируйте строки по email
(возрастающий порядок), используя его порядковый номер.
SELECT * from hr.employees
WHERE (department_id = 50 OR department_id = 80) AND COMMISSION_PCT IS NOT NULL
ORDER BY 4;

 -- 7. Получите список всех сотрудников, у которых в имени содержатся 
минимум 2 буквы 'n'.
SELECT * from hr.employees
WHERE first_name LIKE '%n%n%';

 -- 8. Получить список всех сотрудников, у которых длина имени больше 4 
букв. Отсортируйте строки по номеру департамента (убывающий 
порядок) так, чтобы значения “null” были в самом конце.
SELECT * from hr.employees
WHERE LENGTH(first_name)>4
ORDER BY department_id DESC NULLS LAST;

 -- 9. Получите список всех сотрудников, у которых зарплата находится в 
промежутке от 3000 до 7000 (включительно), нет бонуса 
(комиссионных) и job_id среди следующих вариантов: PU_CLERK, 
ST_MAN, ST_CLERK.
SELECT * from hr.employees
WHERE salary BETWEEN 3000 AND 7000 AND COMMISSION_PCT IS NULL 
AND job_id IN ('PU_CLERK', 'ST_MAN', 'ST_CLERK');

 -- 10.Получите список всех сотрудников у которых в имени содержится 
символ '%'.
SELECT *
from hr.employees
WHERE first_name LIKE '%\%%' escape '\';

 -- 11.Выведите информацию о job_id, имени и з/п для работников, рабочий id которых больше или равен 120 и job_id не равен IT_PROG. 
 -- Отсортируйте строки по job_id (возрастающий порядок) и именам(убывающий порядок)
SELECT job_id, first_name, salary
from hr.employees
WHERE employee_id >=120 AND job_id != 'IT_PROG'
ORDER BY job_id, first_name DESC;



