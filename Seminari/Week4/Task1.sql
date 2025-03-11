--use movies;

--- 1. Напишете заявка, която извежда името на продуцента и имената на филмите, 
--продуцирани от продуцента на филма ‘Star Wars’. 
--SELECT PR.NAME, MOV.TITLE
--FROM MOVIE AS MOV INNER JOIN MOVIEEXEC AS PR
--ON MOV.PRODUCERC# = PR.CERT#
--WHERE PR.NAME IN (SELECT NAME FROM MOVIE INNER JOIN MOVIEEXEC 
--				ON PRODUCERC# = CERT# 
--				WHERE TITLE = 'STAR WARS');

-- 2. Напишете заявка, която извежда имената на продуцентите на филмите, в които е участвал ‘Harrison Ford’.
--SELECT DISTINCT PR.NAME
--FROM MOVIE AS MOV INNER JOIN MOVIEEXEC AS PR
--ON MOV.PRODUCERC# = PR.CERT#
--WHERE MOV.TITLE IN (SELECT MOVIETITLE FROM MOVIE INNER JOIN STARSIN
--					ON MOVIETITLE = TITLE
--					WHERE STARNAME = 'HARRISON FORD'); 

-- 3. Напишете заявка, която извежда името на студиото и имената на актьорите, участвали във филми, 
--произведени от това студио, подредени по име на студио. 
--SELECT DISTINCT STUDIONAME, STARNAME
--FROM MOVIE INNER JOIN STARSIN
--ON MOVIETITLE = TITLE AND YEAR = MOVIEYEAR
--ORDER BY STUDIONAME;

-- 4.Напишете заявка, която извежда имената на актьорите, участвали във филми на продуценти с най-големи нетни активи.
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