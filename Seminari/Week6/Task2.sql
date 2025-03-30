--use ships;

--1. �������� ������, ����� ������� ������� �� ������ ������ ��� ����������, ����� �� ��������� � ���� ���� ����� � 
--����� ����� �������� � C ��� K.
--SELECT DISTINCT NAME
--FROM SHIPS INNER JOIN OUTCOMES
--ON NAME = SHIP
--WHERE NAME LIKE 'C%' OR NAME LIKE 'K%';

--2. �������� ������, ����� ������� ��� � ������� �� ������ ������, ����� ������ �� �� �������� � ����� 
--(���� � �� �� �� ���������).
--SELECT DISTINCT NAME, COUNTRY
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--LEFT JOIN OUTCOMES
--ON NAME = SHIP
--WHERE SHIP IS NULL OR RESULT != 'SUNK';

--3. �������� ������, ����� ������� ��������� � ���� �� ���������� ������ �� ���� �������. 
--�������, ����� ����� ������ ��� ���� �����, �� ��� �� � �������� � �����, ���� �� ����� ��������.
--SELECT CLASSES.COUNTRY, COUNT(RESULT) AS COUNT_SUNK
--FROM SHIPS
--	RIGHT JOIN CLASSES ON CLASSES.CLASS = SHIPS.CLASS
--	LEFT JOIN OUTCOMES ON SHIP = NAME
--WHERE RESULT = 'SUNK' OR RESULT IS NULL
--GROUP BY COUNTRY;

--4. �������� ������, ����� ������� ��� �� �������, ����� �� ��-������� (� ������ ��������� ������) 
--�� ������� ��� Guadalcanal.
--SELECT BATTLE, COUNT(SHIP) AS SHIPS_COUNT
--FROM OUTCOMES
--GROUP BY BATTLE
--HAVING COUNT(SHIP) > (SELECT COUNT(SHIP) AS GUADCANAL_SHIP_COUNT
--						FROM OUTCOMES
--						WHERE BATTLE = 'GUADALCANAL');

--5. �������� ������, ����� ������� ��� �� �������, ����� �� ��-������� (� ������ ��������� ������) 
--�� ������� ��� Surigao Strait.
--SELECT BATTLE, COUNT(COUNTRY) AS CONTRIES_COUNT
--FROM OUTCOMES INNER JOIN SHIPS
--ON SHIP = NAME
--INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--GROUP BY BATTLE
--HAVING COUNT(COUNTRY) < (SELECT COUNT(COUNTRY) AS CONTRIES_COUNT
--						FROM OUTCOMES INNER JOIN SHIPS
--						ON SHIP = NAME
--						INNER JOIN CLASSES
--						ON SHIPS.CLASS = CLASSES.CLASS
--						WHERE BATTLE = 'Surigao Strait');

--6. �������� ������, ����� ������� ������� �� ���-������ ������ � ���-����� ������. 
--SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE CLASSES.DISPLACEMENT <= ALL (SELECT CLASSES.DISPLACEMENT 
--									FROM CLASSES INNER JOIN SHIPS 
--									ON CLASSES.CLASS = SHIPS.CLASS) 
--	AND CLASSES.DISPLACEMENT >= ALL (SELECT CLASSES.NUMGUNS 
--								FROM CLASSES INNER JOIN SHIPS 
--								ON CLASSES.CLASS = SHIPS.CLASS);

--7. �������� ���� �� ��������, ����� �� ���� �������� � �����, �� �� ���� ��������� � ��-����� �� 
--�������� � ����� �����.
--SELECT DISTINCT COUNT(SHIP) AS SHIPS_COUNT
--FROM OUTCOMES AS O INNER JOIN BATTLES
--ON NAME = BATTLE
--GROUP BY O.SHIP, O.RESULT, BATTLES.DATE
--HAVING RESULT = 'DAMAGED' AND DATE < ALL(SELECT DATE
--									FROM BATTLES INNER JOIN OUTCOMES
--									ON NAME = BATTLE
--									WHERE OUTCOMES.SHIP = O.SHIP AND RESULT = 'OK');

--8. �������� ��� �� ��������, ����� �� ���� �������� � �����, �� �� ���� ��������� � ��-����� �� �������� 
--� ��-������� ����� (� ������ ������).
SELECT SHIP
FROM OUTCOMES AS O INNER JOIN BATTLES AS B
ON BATTLE = NAME
GROUP BY O.SHIP, O.RESULT, B.DATE
HAVING RESULT = 'DAMAGED' AND B.DATE < (SELECT DATE
										FROM BATTLES INNER JOIN OUTCOMES
										ON BATTLE = NAME
										WHERE OUTCOMES.SHIP = O.SHIP
										GROUP BY OUTCOMES.SHIP, OUTCOMES.RESULT, BATTLES.DATE
										HAVING OUTCOMES.RESULT = 'OK')
						AND COUNT(O.SHIP) <= (SELECT COUNT(OUTCOMES.SHIP)
										FROM OUTCOMES INNER JOIN BATTLES
										ON BATTLE = NAME
										WHERE OUTCOMES.SHIP = O.SHIP
										GROUP BY OUTCOMES.BATTLE, OUTCOMES.RESULT, BATTLES.DATE
										HAVING OUTCOMES.RESULT = 'OK');