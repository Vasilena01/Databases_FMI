--use movies;

-- 1. Напишете заявка, която извежда имената на актьорите мъже, участвали във филма The Usual Suspects. 
--SELECT NAME
--FROM MOVIESTAR INNER JOIN STARSIN
--ON MOVIESTAR.NAME = STARSIN.STARNAME
--WHERE MOVIESTAR.GENDER = 'M' AND STARSIN.MOVIETITLE = 'The Usual Suspects';

-- 2. Напишете заявка, която извежда имената на актьорите, участвали във филми от 1995, продуцирани от студио MGM. 
--SELECT STARNAME
--FROM STARSIN INNER JOIN MOVIE
--ON STARSIN.MOVIEYEAR = MOVIE.YEAR
--WHERE STARSIN.MOVIEYEAR = 1995 AND MOVIE.STUDIONAME = 'MGM';

-- 3. Напишете заявка, която извежда имената на продуцентите, които са продуцирали филми на студио MGM.
--SELECT DISTINCT MOVIEEXEC.NAME
--FROM MOVIE INNER JOIN MOVIEEXEC
--ON MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
--WHERE MOVIE.STUDIONAME = 'MGM';

-- 4. Напишете заявка, която извежда имената на всички филми с дължина, поголяма от дължината на филма Star Wars. 
--SELECT M2.TITLE
--FROM MOVIE AS M1, MOVIE AS M2
--WHERE M1.TITLE = 'Star Wars' AND (M2.LENGTH > M1.LENGTH);

-- 5. Напишете заявка, която извежда имената на продуцентите с нетни активи поголеми от тези на Stephen Spielberg.
SELECT M2.NAME
FROM MOVIEEXEC AS M1, MOVIEEXEC AS M2
WHERE M1.NAME = 'Stephen Spielberg' AND (M2.NETWORTH > M1.NETWORTH);