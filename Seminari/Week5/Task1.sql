--use pc;

--1. Напишете заявка, която извежда средната честота на персоналните компютри.
--SELECT CONVERT(DECIMAL(9, 2), AVG(SPEED)) AS AVGSPEED
--FROM PC;

--2. Напишете заявка, която извежда средния размер на екраните на лаптопите за всеки производител.
--SELECT PRODUCT.MAKER, AVG(SCREEN) AS AVGSCREEN
--FROM LAPTOP INNER JOIN PRODUCT
--ON LAPTOP.MODEL = PRODUCT.MODEL
--GROUP BY PRODUCT.MAKER;

--3. Напишете заявка, която извежда средната честота на лаптопите с цена над 1000.
--SELECT CONVERT(DECIMAL(9, 2), AVG(SPEED)) AS AVGSPEED
--FROM LAPTOP
--WHERE PRICE > 1000;

--4. Напишете заявка, която извежда средната цена на персоналните компютри, произведени от производител ‘A’.
--SELECT PRODUCT.MAKER, CONVERT(DECIMAL(9, 2), AVG(PRICE)) AS AVGPRICE
--FROM PC INNER JOIN PRODUCT
--ON PC.MODEL = PRODUCT.MODEL
--WHERE PRODUCT.MAKER = 'A'
--GROUP BY PRODUCT.MAKER;

--5. Напишете заявка, която извежда средната цена на персоналните компютри и лаптопите за производител ‘B’.
--SELECT AVG(UNION_TABLE.price) AS AVG_PRICE
--FROM ((SELECT PC.PRICE
--	FROM PC INNER JOIN PRODUCT
--	ON PC.MODEL = PRODUCT.MODEL
--	WHERE PRODUCT.MAKER = 'B'
--	UNION ALL
--	SELECT LAPTOP.PRICE
--	FROM LAPTOP INNER JOIN PRODUCT
--	ON LAPTOP.MODEL = PRODUCT.MODEL
--	WHERE PRODUCT.MAKER = 'B')) AS UNION_TABLE;

--6. Напишете заявка, която извежда средната цена на персоналните компютри според различните им честоти.
--SELECT SPEED, AVG(PRICE) AS AVG_PRICE
--FROM PC
--GROUP BY SPEED;

--7. Напишете заявка, която извежда производителите, които са произвели поне 3 различни персонални компютъра (с различен код).
--SELECT PRODUCT.MAKER, COUNT(PC.CODE) AS COUNT_CODE
--FROM PRODUCT INNER JOIN PC
--ON PRODUCT.MODEL = PC.MODEL
--GROUP BY PRODUCT.MAKER
--HAVING COUNT(PC.CODE) >= 3;

--8. Напишете заявка, която извежда производителите с най-висока цена на персонален компютър.
--SELECT PRODUCT.MAKER, PC.PRICE
--FROM PRODUCT INNER JOIN PC
--ON PRODUCT.MODEL = PC.MODEL
--WHERE PC.PRICE = (SELECT MAX(PC.PRICE) FROM PC);

--9. Напишете заявка, която извежда средната цена на персоналните компютри за всяка честота по-голяма от 800.
--SELECT PC.SPEED, AVG(PC.PRICE) AS AVG_PRICE
--FROM PC
--GROUP BY PC.SPEED
--HAVING PC.SPEED > 800;

--10. Напишете заявка, която извежда средния размер на диска на тези персонални компютри, произведени от производители, 
--които произвеждат и принтери. Резултатът да се изведе за всеки отделен производител.
SELECT PRODUCT.MAKER, CONVERT(DECIMAL(9, 2), AVG(HD)) AS AVG_HD
FROM PC INNER JOIN PRODUCT
ON PC.MODEL = PRODUCT.MODEL
WHERE PRODUCT.MAKER IN (SELECT PRODUCT.MAKER 
							FROM PRINTER INNER JOIN PRODUCT
							ON PRINTER.MODEL = PRODUCT.MODEL)
GROUP BY PRODUCT.MAKER;