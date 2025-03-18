--use pc;

--1. �������� ������, ����� ������� �������� ������� �� ������������ ��������.
--SELECT CONVERT(DECIMAL(9, 2), AVG(SPEED)) AS AVGSPEED
--FROM PC;

--2. �������� ������, ����� ������� ������� ������ �� �������� �� ��������� �� ����� ������������.
--SELECT PRODUCT.MAKER, AVG(SCREEN) AS AVGSCREEN
--FROM LAPTOP INNER JOIN PRODUCT
--ON LAPTOP.MODEL = PRODUCT.MODEL
--GROUP BY PRODUCT.MAKER;

--3. �������� ������, ����� ������� �������� ������� �� ��������� � ���� ��� 1000.
--SELECT CONVERT(DECIMAL(9, 2), AVG(SPEED)) AS AVGSPEED
--FROM LAPTOP
--WHERE PRICE > 1000;

--4. �������� ������, ����� ������� �������� ���� �� ������������ ��������, ����������� �� ������������ �A�.
--SELECT PRODUCT.MAKER, CONVERT(DECIMAL(9, 2), AVG(PRICE)) AS AVGPRICE
--FROM PC INNER JOIN PRODUCT
--ON PC.MODEL = PRODUCT.MODEL
--WHERE PRODUCT.MAKER = 'A'
--GROUP BY PRODUCT.MAKER;

--5. �������� ������, ����� ������� �������� ���� �� ������������ �������� � ��������� �� ������������ �B�.
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

--6. �������� ������, ����� ������� �������� ���� �� ������������ �������� ������ ���������� �� �������.
--SELECT SPEED, AVG(PRICE) AS AVG_PRICE
--FROM PC
--GROUP BY SPEED;

--7. �������� ������, ����� ������� ���������������, ����� �� ��������� ���� 3 �������� ���������� ��������� (� �������� ���).
--SELECT PRODUCT.MAKER, COUNT(PC.CODE) AS COUNT_CODE
--FROM PRODUCT INNER JOIN PC
--ON PRODUCT.MODEL = PC.MODEL
--GROUP BY PRODUCT.MAKER
--HAVING COUNT(PC.CODE) >= 3;

--8. �������� ������, ����� ������� ��������������� � ���-������ ���� �� ���������� ��������.
--SELECT PRODUCT.MAKER, PC.PRICE
--FROM PRODUCT INNER JOIN PC
--ON PRODUCT.MODEL = PC.MODEL
--WHERE PC.PRICE = (SELECT MAX(PC.PRICE) FROM PC);

--9. �������� ������, ����� ������� �������� ���� �� ������������ �������� �� ����� ������� ��-������ �� 800.
--SELECT PC.SPEED, AVG(PC.PRICE) AS AVG_PRICE
--FROM PC
--GROUP BY PC.SPEED
--HAVING PC.SPEED > 800;

--10. �������� ������, ����� ������� ������� ������ �� ����� �� ���� ���������� ��������, ����������� �� �������������, 
--����� ����������� � ��������. ���������� �� �� ������ �� ����� ������� ������������.
SELECT PRODUCT.MAKER, CONVERT(DECIMAL(9, 2), AVG(HD)) AS AVG_HD
FROM PC INNER JOIN PRODUCT
ON PC.MODEL = PRODUCT.MODEL
WHERE PRODUCT.MAKER IN (SELECT PRODUCT.MAKER 
							FROM PRINTER INNER JOIN PRODUCT
							ON PRINTER.MODEL = PRODUCT.MODEL)
GROUP BY PRODUCT.MAKER;