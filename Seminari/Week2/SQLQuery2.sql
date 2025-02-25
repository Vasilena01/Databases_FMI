--use pc;

--1. �������� ������, ����� ������� ������������� � ��������� �� ��������� � ������ �� ����� ���� 9 GB.
--SELECT PRODUCT.maker, LAPTOP.speed
--FROM LAPTOP INNER JOIN PRODUCT
--ON LAPTOP.model = PRODUCT.MODEL
--WHERE LAPTOP.hd > 9;

--2. �������� ������, ����� ������� ����� � ���� �� ����������, ����������� �� ������������ � ��� B.
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

--3. �������� ������, ����� ������� ���������������, ����� ����������� �������, �� �� ����������� ���������� ��������.
--SELECT PRODUCT.maker
--FROM PRODUCT INNER JOIN LAPTOP
--ON PRODUCT.model = LAPTOP.model
--EXCEPT
--SELECT PRODUCT.maker
--FROM PRODUCT INNER JOIN PC
--ON PRODUCT.model = PC.model

--4. �������� ������, ����� ������� ��������� �� ���� �������, 
	--����� �� ��������� � ���� ��� �������� ���������� ��������� (��� ��������� � �������� ���).
--SELECT DISTINCT P1.hd
--FROM PC AS P1 INNER JOIN PC AS P2
--ON P1.hd = P2.hd
--WHERE P1.code != P2.code;

--5. �������� ������, ����� ������� �������� ������ �� ���������� ��������, ����� ���� ������� ������� � �����. 
	--�������� ������ �� �� �������� ���� �� ������, �������� ���� (i, j), �� �� � (j, i).
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

--6. �������� ������, ����� ������� ��������������� �� ���� ��� �������� ���������� ��������� � ������� ���� 400.
SELECT DISTINCT PR1.maker
FROM PRODUCT AS PR1, PRODUCT AS PR2, PC AS P1, PC AS P2
WHERE P1.code != P2.code AND
	PR1.maker = PR2.maker AND
	P1.model = PR1.model AND
	P2.model = PR2.model AND
	P1.speed >= 400 AND 
	P2.speed >= 400;