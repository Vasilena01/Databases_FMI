--USE SHIPS;

--1. �������� ������, ����� ������� ���� �� ��������� ����� ������.
--SELECT COUNT(CLASSES.CLASS) AS CLASSES_COUNT
--FROM CLASSES
--WHERE CLASSES.TYPE = 'BB';

--2. �������� ������, ����� ������� ������� ���� ������ �� ����� ���� ���� �����.
--SELECT CLASSES.CLASS, AVG(CLASSES.NUMGUNS) AS AVG_NUMGUNS
--FROM CLASSES
--WHERE CLASSES.TYPE = 'BB'
--GROUP BY CLASSES.CLASS;

--3. �������� ������, ����� ������� ������� ���� ������ �� ������ ����� ������.
--SELECT AVG(CLASSES.NUMGUNS) AS AVG_NUMGUNS
--FROM CLASSES
--WHERE CLASSES.TYPE = 'BB';

--4. �������� ������, ����� ������� �� ����� ���� ������� � ���������� ������, � ����� ����� �� 
--���������� ���� � ������ �� ����.
--SELECT SHIPS.CLASS, MIN(SHIPS.LAUNCHED) AS FIRST_YEAR, MAX(SHIPS.LAUNCHED) AS LAST_YEAR
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--GROUP BY SHIPS.CLASS;

--5. �������� ������, ����� ������� ���� �� ��������, �������� � ����� ������ �����.
--SELECT SHIPS.CLASS, COUNT(SHIPS.NAME) AS SHIPS_NAME_SUNK
--FROM SHIPS INNER JOIN OUTCOMES
--ON SHIPS.NAME = OUTCOMES.SHIP
--WHERE OUTCOMES.RESULT = 'SUNK'
--GROUP BY SHIPS.CLASS;

--6. �������� ������, ����� ������� ���� �� ��������, �������� � ����� ������ �����, �� ���� ������� � ������ �� 2 ������.
--SELECT SHIPS.CLASS, COUNT(SHIPS.NAME) AS SHIPS_NAME_SUNK
--FROM SHIPS INNER JOIN OUTCOMES
--ON SHIPS.NAME = OUTCOMES.SHIP
--WHERE OUTCOMES.RESULT = 'SUNK' AND SHIPS.CLASS IN (SELECT SHIPS.CLASS 
--													FROM SHIPS
--													GROUP BY SHIPS.CLASS
--													HAVING COUNT(SHIPS.CLASS) > 2)
--GROUP BY SHIPS.CLASS;

--7. �������� ������, ����� ������� ������� ������� �� �������� �� �������� �� ����� ������.
SELECT COUNTRY, CONVERT(DECIMAL(9, 2), AVG(BORE)) AS AVG_BORE
FROM CLASSES JOIN SHIPS
ON CLASSES.CLASS = SHIPS.CLASS
GROUP BY COUNTRY;