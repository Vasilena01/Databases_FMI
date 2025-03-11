--use ships;

-- 1. �������� ������, ����� ������� ������ ������� ���������� �� ����� �����, ����������� � ������� �� ������� ����. 
--� ��������� �� ������ �� �� �������� ���� �������, ����� ����� ������.
--SELECT *
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS;

-- 2. ��������� ������� ������, ���� ���� ��� �������� � ��������� � ���������, 
--����� ����� ������, �� ����������� ������ ��� ������ ��� ���� �������.
--SELECT *
--FROM CLASSES LEFT JOIN SHIPS
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE CLASSES.CLASS IN (SELECT NAME FROM SHIPS);

-- 3. �� ����� ������ �������� ������� �� ��������, ����� ������ �� �� ��������� � �����. 
--SELECT CLASSES.COUNTRY, SHIPS.NAME
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--LEFT JOIN OUTCOMES
--ON SHIPS.NAME = OUTCOMES.SHIP
--WHERE OUTCOMES.BATTLE IS NULL;

-- 4. �������� ������� �� ������ ������ � ���� 7 ������, ������� �� ���� ���� 1916, 
--�� �������� ������������ ������ Ship Name.
--SELECT NAME AS 'Ship Name'
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE CLASSES.NUMGUNS >= 7 AND SHIPS.LAUNCHED = 1916;

-- 5. �������� ������� �� ������ �������� � ����� ������, ����� � ���� �� ���������� �� �������, � ����� �� �� ��������. 
--��������� ��������� �� ��� �� �������.
--SELECT OUTCOMES.SHIP, BATTLES.NAME, BATTLES.DATE
--FROM OUTCOMES INNER JOIN BATTLES
--ON OUTCOMES.BATTLE = BATTLES.NAME
--WHERE OUTCOMES.RESULT = 'SUNK'
--ORDER BY BATTLES.NAME;

-- 6. �������� �����, ����������������� � �������� �� ������� �� ���� �� ������ ������, 
--����� ���� ������ ��� ���� ������ ����. 
--SELECT NAME, LAUNCHED, DISPLACEMENT
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE SHIPS.NAME = CLASSES.CLASS;

-- 7. �������� ������ ������� ������, �� ����� ���� ������ �� ���� ���� ���� �����.
--SELECT *
--FROM CLASSES
--WHERE CLASSES.CLASS NOT IN (SELECT CLASSES.CLASS FROM CLASSES INNER JOIN SHIPS ON SHIPS.CLASS = CLASSES.CLASS);

-- 8. �������� �����, ����������������� � ���� ������ �� ��������, ��������� � ������� �North Atlantic�, 
--� ���� � ��������� �� �������.
--SELECT NAME, DISPLACEMENT, CLASSES.NUMGUNS, OUTCOMES.RESULT
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--INNER JOIN OUTCOMES
--ON SHIPS.NAME = OUTCOMES.SHIP
--WHERE OUTCOMES.BATTLE = 'NORTH ATLANTIC';