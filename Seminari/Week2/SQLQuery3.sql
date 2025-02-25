--use ships;

-- 1. �������� ������, ����� ������� ����� �� �������� � ��������������� ��� 50000.
--SELECT SHIPS.NAME
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE CLASSES.DISPLACEMENT > 50000;

-- 2. �������� ������, ����� ������� �������, 
	--����������������� � ���� ������ �� ������ ������, ��������� � ������� ��� Guadalcanal.
--SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--INNER JOIN OUTCOMES
--ON SHIPS.NAME = OUTCOMES.SHIP
--WHERE OUTCOMES.BATTLE = 'Guadalcanal';

-- 3. �������� ������, ����� ������� ������� �� ���� �������, ����� ���� ����� ����� ������, ���� � ����� ��������. 
--SELECT DISTINCT CLASSES.COUNTRY
--FROM CLASSES INNER JOIN SHIPS
--ON CLASSES.CLASS = SHIPS.CLASS
--WHERE CLASSES.TYPE = 'bb'
--INTERSECT
--SELECT DISTINCT CLASSES.COUNTRY
--FROM CLASSES INNER JOIN SHIPS
--ON CLASSES.CLASS = SHIPS.CLASS
--WHERE CLASSES.TYPE = 'bc';

-- 4. �������� ������, ����� ������� ������� �� ���� ������, ����� �� ���� ��������� � ���� �����, 
	--�� ��-����� �� ��������� � ����� �����.
SELECT SHIPS.NAME
FROM SHIPS, OUTCOMES AS O1, BATTLES AS B1, OUTCOMES AS O2, BATTLES AS B2
WHERE SHIPS.NAME = O1.SHIP AND
	SHIPS.NAME = O2.SHIP AND
	O1.BATTLE = B1.NAME AND
	O2.BATTLE = B2.NAME AND
	B1.DATE < B2.DATE AND
	O1.RESULT = 'damaged';
