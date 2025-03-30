--use movies;

--1. �������� ������, ����� ������� �������� � ������ �� ������ �����, ����� �� ��-����� �� 120 ������ � �� ������� ����� 2000 �. 
-- ��� ��������� �� ����� � ����������, ���������� � �������� �� ���� ���� ���� �� �� �������.

--SELECT TITLE, YEAR, LENGTH
--FROM MOVIE
--WHERE MOVIE.LENGTH > 120 OR MOVIE.LENGTH IS NULL AND MOVIE.YEAR < 2000;

--2. �������� ������, ����� ������� ��� � ��� �� ������ ������� (���� � ����), ����� ��� ������� � 'J' � �� ������ ���� 1948 ������. 
--���������� �� ���� �������� �� ��� � ��������� ���.
--SELECT NAME, GENDER
--FROM MOVIESTAR
--WHERE NAME LIKE 'J%' AND BIRTHDATE > 1948
--ORDER BY NAME DESC;

--3. �������� ������, ����� ������� ��� �� ������ � ���� �� ���������, ��������� ��� �����, 
--����� �� ��������� �� ���� ������. 
--SELECT MOVIE.STUDIONAME, COUNT(DISTINCT STARSIN.STARNAME) AS STARS_COUNT
--FROM MOVIE INNER JOIN STARSIN
--ON TITLE = MOVIETITLE
--GROUP BY MOVIE.STUDIONAME;

--4. �������� ������, ����� �� ����� ������ ������� ��� �� ������� � ���� �� �������, � ����� �������� � ��������. 
--SELECT NAME, COUNT(MOVIETITLE) AS MOVIES_COUNT
--FROM STARSIN RIGHT JOIN MOVIESTAR
--ON STARNAME = NAME
--GROUP BY NAME;

--5. �������� ������, ����� �� ����� ������ ������� ��� �� �������� � �������� �� �����, 
--������� �������� �� ����� �� ���� ������. 
--SELECT STUDIONAME, TITLE, YEAR
--FROM MOVIE AS M1
--WHERE TITLE = (SELECT TOP 1 TITLE
--				FROM MOVIE
--				WHERE M1.STUDIONAME = STUDIONAME
--				ORDER BY YEAR DESC);

--6. �������� ������, ����� ������� ����� �� ���-������ ������ (���).
--SELECT TOP 1 NAME
--FROM MOVIESTAR
--WHERE GENDER = 'M'
--ORDER BY BIRTHDATE DESC;

--7. �������� ������, ����� ������� ��� �� ������ � ��� �� ������ �� ���� �������, ��������� � ���-����� ����� �� ���� ������.
--SELECT DISTINCT STARSIN.STARNAME, STUDIONAME
--FROM STARSIN INNER JOIN MOVIE AS M
--ON M.TITLE = MOVIETITLE
--WHERE STARNAME IN (SELECT TOP 1 STARNAME
--					FROM MOVIE INNER JOIN STARSIN
--					ON TITLE = MOVIETITLE
--					WHERE M.STUDIONAME = STUDIONAME
--					GROUP BY STUDIONAME, STARNAME
--					ORDER BY COUNT(STARNAME) DESC);

--8. �������� ������, ����� ������� �������� � ������ �� �����, � ���� �� ���������, ��������� � ���� ���� �� 
--���� ����� � ������ �� ����� �������.
SELECT MOVIETITLE, MOVIEYEAR, COUNT(STARNAME) AS ACTORS_COUNT
FROM STARSIN
GROUP BY MOVIETITLE, MOVIEYEAR
HAVING COUNT(STARNAME) > 2;