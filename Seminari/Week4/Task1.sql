--use movies;

--- 1. �������� ������, ����� ������� ����� �� ���������� � ������� �� �������, 
--����������� �� ���������� �� ����� �Star Wars�. 
--SELECT PR.NAME, MOV.TITLE
--FROM MOVIE AS MOV INNER JOIN MOVIEEXEC AS PR
--ON MOV.PRODUCERC# = PR.CERT#
--WHERE PR.NAME IN (SELECT NAME FROM MOVIE INNER JOIN MOVIEEXEC 
--				ON PRODUCERC# = CERT# 
--				WHERE TITLE = 'STAR WARS');

-- 2. �������� ������, ����� ������� ������� �� ������������ �� �������, � ����� � �������� �Harrison Ford�.
--SELECT DISTINCT PR.NAME
--FROM MOVIE AS MOV INNER JOIN MOVIEEXEC AS PR
--ON MOV.PRODUCERC# = PR.CERT#
--WHERE MOV.TITLE IN (SELECT MOVIETITLE FROM MOVIE INNER JOIN STARSIN
--					ON MOVIETITLE = TITLE
--					WHERE STARNAME = 'HARRISON FORD'); 

-- 3. �������� ������, ����� ������� ����� �� �������� � ������� �� ���������, ��������� ��� �����, 
--����������� �� ���� ������, ��������� �� ��� �� ������. 
--SELECT DISTINCT STUDIONAME, STARNAME
--FROM MOVIE INNER JOIN STARSIN
--ON MOVIETITLE = TITLE AND YEAR = MOVIEYEAR
--ORDER BY STUDIONAME;

-- 4.�������� ������, ����� ������� ������� �� ���������, ��������� ��� ����� �� ���������� � ���-������ ����� ������.
--SELECT STARNAME
--FROM MOVIE INNER JOIN STARSIN
--ON MOVIETITLE = TITLE AND YEAR = MOVIEYEAR
--WHERE PRODUCERC# IN (SELECT TOP 1 PRODUCERC# FROM MOVIE INNER JOIN MOVIEEXEC
--				ON PRODUCERC# = CERT#
--				ORDER BY NETWORTH DESC);

--SELECT NAME
--FROM MOVIESTAR LEFT JOIN STARSIN
--ON STARNAME = NAME
--WHERE MOVIETITLE IS NULL;