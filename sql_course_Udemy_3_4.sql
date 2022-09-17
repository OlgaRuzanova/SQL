 -- 1.	Получите список всех сотрудников с именем David.
SELECT * from hr.employees
WHERE first_name = 'David';

 -- 2.	Получите список всех сотрудников, у которых job_id равен FI_ACCOUNT.
SELECT * from hr.employees
WHERE job_id = 'FI_ACCOUNT';

 -- 3. Выведите информацию о имени, фамилии, з/п и номере департамента для сотрудников из 50го департамента с зарплатой, большей 4000.
SELECT first_name, last_name, salary, department_id
from hr.employees
WHERE department_id =50 AND salary > 4000;

 -- 4. Получите список всех сотрудников, которые работают или в 20м, или в 30м департаменте.
SELECT *
from hr.employees
WHERE department_id = 20 OR department_id = 30;

 -- 5. Получите список всех сотрудников, у которых вторая и последняя буква в имени равна 'a'.
SELECT * from hr.employees
WHERE first_name LIKE '_a%a';

 -- 6. Получите список всех сотрудников из 50го и из 80го департамента, у которых есть бонус(комиссионные). Отсортируйте строки по email
 -- (возрастающий порядок), используя его порядковый номер.
SELECT * from hr.employees
WHERE (department_id = 50 OR department_id = 80) AND COMMISSION_PCT IS NOT NULL
ORDER BY 4;

 -- 7. Получите список всех сотрудников, у которых в имени содержатся минимум 2 буквы 'n'.
SELECT * from hr.employees
WHERE first_name LIKE '%n%n%';

 -- 8. Получить список всех сотрудников, у которых длина имени больше 4 букв. Отсортируйте строки по номеру департамента (убывающий порядок) так, чтобы значения “null” были в самом конце.
SELECT * from hr.employees
WHERE LENGTH(first_name)>4
ORDER BY department_id DESC NULLS LAST;

 -- 9. Получите список всех сотрудников, у которых зарплата находится в промежутке от 3000 до 7000 (включительно), нет бонуса 
 -- (комиссионных) и job_id среди следующих вариантов: PU_CLERK, ST_MAN, ST_CLERK.
SELECT * from hr.employees
WHERE salary BETWEEN 3000 AND 7000 AND COMMISSION_PCT IS NULL 
AND job_id IN ('PU_CLERK', 'ST_MAN', 'ST_CLERK');

 -- 10.Получите список всех сотрудников у которых в имени содержится символ '%'.
SELECT * from hr.employees
WHERE first_name LIKE '%\%%' escape '\';

 -- 11.Выведите информацию о job_id, имени и з/п для работников, рабочий id которых больше или равен 120 и job_id не равен IT_PROG. 
 -- Отсортируйте строки по job_id (возрастающий порядок) и именам(убывающий порядок).
SELECT job_id, first_name, salary from hr.employees
WHERE employee_id >=120 AND job_id != 'IT_PROG'
ORDER BY job_id, first_name DESC;

 -- 12. Получите список всех сотрудников, у которых длина имени больше 10 букв.
 SELECT * from hr.employees
 WHERE LENGTH(first_name) > 10;

 -- 13. Получите список всех сотрудников, зарплата которых кратна 1000.
 SELECT * from hr.employees
 WHERE MOD(salary, 1000) = 0;
 
 -- 14. Выведите телефонный номер и первое 3х значное число телефонного номера сотрудника, если его номер представлен в формате ХХХ.ХХХ.ХХХХ .
 SELECT phone_number, SUBSTR(phone_number, 1, 3) from hr.employees
 WHERE phone_number LIKE '___.___.____';
 
 -- 15. Получите список всех сотрудников, у которых последняя буква в имени равна 'm' и длина имени больше 5ти.
 SELECT * from hr.employees
 WHERE SUBSTR(first_name, -1) = 'm' AND LENGTH(first_name)>5;
 
 -- 16. Выведите дату следующей пятницы.
 SELECT NEXT_DAY(SYSDATE, 5) from dual;
 
 -- 17. Получите список всех сотрудников, которые работают в компании больше 12 лет и 6ти месяцев (150 месяцев).
 SELECT * from hr.employees
 WHERE MONTHS_BETWEEN(SYSDATE, hire_date) > 150;
 
  -- 18. Выведите телефонный номер, заменив в значении PHONE_NUMBER все '.' на '-'.
 SELECT REPLACE (PHONE_NUMBER,'.','-') PHONE_NUMBER_NEW from hr.employees;

 -- 19. Выведите имя, email, job_id для всех работников в формате: STEVEN sking Ad_Pres
 SELECT UPPER(FIRST_NAME) name,LOWER(EMAIL) email, INITCAP(JOB_ID) JOB_ID from hr.employees;

 -- 20. Выведите информацию о имени работника и его з/п, не используя символ || , в таком виде: Steven24000
 SELECT CONCAT (FIRST_NAME,SALARY) name_salary from hr.employees;

 -- 21. Выведите информацию о дате приёма сотрудника на работу, округлённой дате приёма на работу до месяца и первом дне года приёма на работу.
 SELECT HIRE_DATE, ROUND(HIRE_DATE,'MM'), TRUNC(HIRE_DATE,'YYYY' )from hr.employees;

 -- 22. Выведите информацию о имени и фамилии всех работников. Имя должно состоять из 10 символов и если длина имени меньше 10, то дополняйте до 10 символов знаком $. Фамилия должна состоять из 15
 -- символов и если длина фамилии меньше 15, то перед фамилией ставьте столько знаков ! сколько необходимо.
 SELECT RPAD(FIRST_NAME,10,'$') f_name, LPAD(LAST_NAME,15,'!') l_name from hr.employees;

 -- 23. Выведите имя сотрудника и позицию второй буквы ‘a’ в его имени.
 SELECT FIRST_NAME from hr.employees
 WHERE INSTR(FIRST_NAME,'a')=2;

 -- 24. Выведите на экран текст '!!!HELLO!! MY FRIEND!!!!!!!!' и тот же текст, но без символа восклицательный знак в начале и конце текста.
SELECT '!!!HELLO!! MY FRIEND!!!!!!!!' from dual;
SELECT TRIM('!' from '!!!HELLO!! MY FRIEND!!!!!!!!') from dual;

 -- 25. Выведите информацию о:
 -- • з/п работника,
 -- • з/п умноженной на коэффициент 3.1415 ,
 -- • округлённый до целого значения вариант увеличенной з/п-ты,
 -- • целое количество тысяч из увеличенной з/п.
 SELECT SALARY,(SALARY * 3.1415) salary_new, 
 ROUND(SALARY * 3.1415) salary_int, 
 TRUNC(SALARY * 3.1415,-3)/1000
 from hr.employees;
 
 -- 26. Выведите информацию о:
 -- • дате приёма сотрудника на работу,
 -- • дате, которая была через пол года, после принятия сотрудника на работу,
 -- • дате последнего дня в месяце принятия сотрудника на работу.
 SELECT HIRE_DATE, ADD_MONTHS(HIRE_DATE,6) HIRE_DATE_6M, LAST_DAY(HIRE_DATE) from hr.employees;


