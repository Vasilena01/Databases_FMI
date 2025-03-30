--use ships;

--1. Напишете заявка, която извежда имената на всички кораби без повторения, които са участвали в поне една битка и 
--чиито имена започват с C или K.
--SELECT DISTINCT NAME
--FROM SHIPS INNER JOIN OUTCOMES
--ON NAME = SHIP
--WHERE NAME LIKE 'C%' OR NAME LIKE 'K%';

--2. Напишете заявка, която извежда име и държава на всички кораби, които никога не са потъвали в битка 
--(може и да не са участвали).
--SELECT DISTINCT NAME, COUNTRY
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--LEFT JOIN OUTCOMES
--ON NAME = SHIP
--WHERE SHIP IS NULL OR RESULT != 'SUNK';

--3. Напишете заявка, която извежда държавата и броя на потъналите кораби за тази държава. 
--Държави, които нямат кораби или имат кораб, но той не е участвал в битка, също да бъдат изведени.
--SELECT CLASSES.COUNTRY, COUNT(RESULT) AS COUNT_SUNK
--FROM SHIPS
--	RIGHT JOIN CLASSES ON CLASSES.CLASS = SHIPS.CLASS
--	LEFT JOIN OUTCOMES ON SHIP = NAME
--WHERE RESULT = 'SUNK' OR RESULT IS NULL
--GROUP BY COUNTRY;

--4. Напишете заявка, която извежда име на битките, които са по-мащабни (с повече участващи кораби) 
--от битката при Guadalcanal.
--SELECT BATTLE, COUNT(SHIP) AS SHIPS_COUNT
--FROM OUTCOMES
--GROUP BY BATTLE
--HAVING COUNT(SHIP) > (SELECT COUNT(SHIP) AS GUADCANAL_SHIP_COUNT
--						FROM OUTCOMES
--						WHERE BATTLE = 'GUADALCANAL');

--5. Напишете заявка, която извежда име на битките, които са по-мащабни (с повече участващи страни) 
--от битката при Surigao Strait.
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

--6. Напишете заявка, която извежда имената на най-леките кораби с най-много оръдия. 
--SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE CLASSES.DISPLACEMENT <= ALL (SELECT CLASSES.DISPLACEMENT 
--									FROM CLASSES INNER JOIN SHIPS 
--									ON CLASSES.CLASS = SHIPS.CLASS) 
--	AND CLASSES.DISPLACEMENT >= ALL (SELECT CLASSES.NUMGUNS 
--								FROM CLASSES INNER JOIN SHIPS 
--								ON CLASSES.CLASS = SHIPS.CLASS);

--7. Изведете броя на корабите, които са били увредени в битка, но са били поправени и по-късно са 
--победили в друга битка.
--SELECT DISTINCT COUNT(SHIP) AS SHIPS_COUNT
--FROM OUTCOMES AS O INNER JOIN BATTLES
--ON NAME = BATTLE
--GROUP BY O.SHIP, O.RESULT, BATTLES.DATE
--HAVING RESULT = 'DAMAGED' AND DATE < ALL(SELECT DATE
--									FROM BATTLES INNER JOIN OUTCOMES
--									ON NAME = BATTLE
--									WHERE OUTCOMES.SHIP = O.SHIP AND RESULT = 'OK');

--8. Изведете име на корабите, които са били увредени в битка, но са били поправени и по-късно са победили 
--в по-мащабна битка (с повече кораби).
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