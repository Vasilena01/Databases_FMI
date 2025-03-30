--USE PC;

--1. Напишете заявка, която извежда всички модели лаптопи, за които се предлагат както разновидности с 15" екран, 
--така и с 11" екран. 
--SELECT LAPTOP.MODEL
--FROM LAPTOP
--GROUP BY LAPTOP.MODEL, LAPTOP.SCREEN
--HAVING LAPTOP.SCREEN = 15 
--INTERSECT
--SELECT LAPTOP.MODEL 
--FROM LAPTOP
--GROUP BY LAPTOP.MODEL, LAPTOP.SCREEN
--HAVING LAPTOP.SCREEN = 11;

--2. Да се изведат различните модели компютри, чиято цена е по-ниска от най-евтиния лаптоп, 
--произвеждан от същия производител.
--SELECT DISTINCT PC.MODEL
--FROM PC INNER JOIN PRODUCT AS P1
--ON PC.MODEL = P1.MODEL
--GROUP BY PC.MODEL, P1.MAKER, PC.PRICE
--HAVING PC.PRICE < (SELECT TOP 1 LAPTOP.PRICE
--					FROM LAPTOP INNER JOIN PRODUCT AS P2
--					ON LAPTOP.MODEL = P2.MODEL
--					GROUP BY P2.MAKER, LAPTOP.PRICE
--					HAVING P1.MAKER = P2.MAKER
--					ORDER BY LAPTOP.PRICE);

--3. Един модел компютри може да се предлага в няколко разновидности с различна цена. 
--Да се изведат тези модели компютри, чиято средна цена (на различните му разновидности) е по-ниска от 
--най-евтиния лаптоп, произвеждан от същия производител.
--SELECT P1.MODEL, AVG(PRICE) AS AVG_PC_PRICE
--FROM PC AS P1 INNER JOIN PRODUCT AS P
--ON P1.MODEL = P.MODEL
--GROUP BY P1.MODEL, P.MAKER
--HAVING AVG(PRICE) < (SELECT TOP 1 LAPTOP.PRICE
--					FROM LAPTOP INNER JOIN PRODUCT
--					ON LAPTOP.MODEL = PRODUCT.MODEL
--					WHERE PRODUCT.MAKER = P.MAKER
--					ORDER BY PRICE);

--4. Напишете заявка, която извежда за всеки компютър код на продукта, производител и брой компютри, 
--които имат цена, по-голяма или равна на неговата.
SELECT PC1.CODE, P.MAKER,
	(SELECT COUNT(PC2.CODE) FROM PC AS PC2 WHERE PC1.PRICE <= PC2.PRICE) AS PC_COUNT
FROM PC AS PC1 INNER JOIN PRODUCT AS P
ON PC1.MODEL = P.MODEL
GROUP BY PC1.CODE, P.MAKER, PC1.PRICE
ORDER BY PC1.PRICE DESC;