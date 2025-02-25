--use pc;

--1. Напишете заявка, която извежда производителя и честотата на лаптопите с размер на диска поне 9 GB.
--SELECT PRODUCT.maker, LAPTOP.speed
--FROM LAPTOP INNER JOIN PRODUCT
--ON LAPTOP.model = PRODUCT.MODEL
--WHERE LAPTOP.hd > 9;

--2. Напишете заявка, която извежда модел и цена на продуктите, произведени от производител с име B.
--SELECT PRODUCT.model, LAPTOP.PRICE
--FROM PRODUCT INNER JOIN LAPTOP
--ON PRODUCT.model = LAPTOP.model
--WHERE PRODUCT.maker = 'B'
--UNION
--SELECT PRODUCT.model, PC.PRICE
--FROM PRODUCT INNER JOIN PC 
--ON PRODUCT.model = PC.model
--WHERE PRODUCT.maker = 'B'
--UNION
--SELECT PRODUCT.model, PRINTER.PRICE
--FROM PRODUCT INNER JOIN PRINTER
--ON PRODUCT.model = PRINTER.model
--WHERE PRODUCT.maker = 'B';

--3. Напишете заявка, която извежда производителите, които произвеждат лаптопи, но не произвеждат персонални компютри.
--SELECT PRODUCT.maker
--FROM PRODUCT INNER JOIN LAPTOP
--ON PRODUCT.model = LAPTOP.model
--EXCEPT
--SELECT PRODUCT.maker
--FROM PRODUCT INNER JOIN PC
--ON PRODUCT.model = PC.model

--4. Напишете заявка, която извежда размерите на тези дискове, 
	--които се предлагат в поне два различни персонални компютъра (два компютъра с различен код).
--SELECT DISTINCT P1.hd
--FROM PC AS P1 INNER JOIN PC AS P2
--ON P1.hd = P2.hd
--WHERE P1.code != P2.code;

--5. Напишете заявка, която извежда двойките модели на персонални компютри, които имат еднаква честота и памет. 
	--Двойките трябва да се показват само по веднъж, например само (i, j), но не и (j, i).
--SELECT P1.model, P2.model
--FROM PC AS P1, PC AS P2
--WHERE P1.model < P2.model AND P1.speed = P2.speed AND P1.ram = P2.ram;

--SELECT P1.model, P2.model
--FROM PC AS P1, PC AS P2
--WHERE P1.model != P2.model AND P1.speed = P2.speed AND P1.ram = P2.ram
--EXCEPT
--SELECT P1.model, P2.model
--FROM PC AS P1, PC AS P2
--WHERE P1.model != P2.model AND P1.model > P2.model AND P1.speed = P2.speed AND P1.ram = P2.ram

--6. Напишете заявка, която извежда производителите на поне два различни персонални компютъра с честота поне 400.
SELECT DISTINCT PR1.maker
FROM PRODUCT AS PR1, PRODUCT AS PR2, PC AS P1, PC AS P2
WHERE P1.code != P2.code AND
	PR1.maker = PR2.maker AND
	P1.model = PR1.model AND
	P2.model = PR2.model AND
	P1.speed >= 400 AND 
	P2.speed >= 400;