 -- 1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
 SELECT model,speed,hd FROM PC
 WHERE price < 500;

 -- 2. Найдите производителей принтеров. Вывести: maker
 SELECT DISTINCT maker FROM Product
 WHERE type = 'Printer';
 
  -- 3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
 SELECT model, ram, screen FROM Laptop
 WHERE price > 1000;
 
  -- 4. Найдите все записи таблицы Printer для цветных принтеров.
 SELECT * FROM Printer 
 WHERE color = 'y';
 
  -- 5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
 SELECT model, speed, hd FROM PC
 WHERE (cd = '12x' OR cd = '24x') AND price < 600;

  -- 6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
 SELECT DISTINCT Product.maker, Laptop.speed FROM Product INNER JOIN Laptop
 ON Product.model = Laptop.model 
 WHERE Laptop.hd >=10;
 
  -- 7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
 SELECT Product.model, PC.price FROM Product INNER JOIN PC ON Product.model = PC.model
 WHERE maker = 'B'
 UNION
 SELECT Product.model, Laptop.price FROM Product INNER JOIN Laptop
 ON Product.model = Laptop.model
 WHERE maker ='B'
 UNION
 SELECT Product.model, Printer.price FROM Product INNER JOIN Printer
 ON Product.model = Printer.model
 WHERE maker ='B';
 
  -- 8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.
 SELECT maker FROM Product
 WHERE type = 'PC'
 EXCEPT 
 SELECT maker FROM Product
 WHERE type = 'Laptop';
 
  -- 9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
 SELECT DISTINCT Product.maker FROM Product
 INNER JOIN PC
 ON Product.model = PC.model 
 WHERE PC.speed >=450;
 
  -- 10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
 SELECT DISTINCT model, price FROM Printer
 WHERE price = (SELECT MAX(price)FROM Printer);
 
  -- 11. Найдите среднюю скорость ПК.
 SELECT AVG (speed) AS Avg_speed
 FROM PC;
 
  -- 12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
 SELECT AVG (speed) AS AVG_speed
 FROM Laptop
 WHERE price > 1000;
 
  -- 13. Найдите среднюю скорость ПК, выпущенных производителем A.
 SELECT AVG (speed) AS AVG_speed
 from PC JOIN Product on
 Product.model = PC.model
 WHERE Product.maker = 'A';


