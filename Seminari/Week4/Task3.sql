--use ships;

-- 1. Напишете заявка, която извежда цялата налична информация за всеки кораб, включително и данните за неговия клас. 
--В резултата не трябва да се включват тези класове, които нямат кораби.
--SELECT *
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS;

-- 2. Повторете горната заявка, като този път включите в резултата и класовете, 
--които нямат кораби, но съществуват кораби със същото име като тяхното.
--SELECT *
--FROM CLASSES LEFT JOIN SHIPS
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE CLASSES.CLASS IN (SELECT NAME FROM SHIPS);

-- 3. За всяка страна изведете имената на корабите, които никога не са участвали в битка. 
--SELECT CLASSES.COUNTRY, SHIPS.NAME
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--LEFT JOIN OUTCOMES
--ON SHIPS.NAME = OUTCOMES.SHIP
--WHERE OUTCOMES.BATTLE IS NULL;

-- 4. Намерете имената на всички кораби с поне 7 оръдия, пуснати на вода през 1916, 
--но наречете резултатната колона Ship Name.
--SELECT NAME AS 'Ship Name'
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE CLASSES.NUMGUNS >= 7 AND SHIPS.LAUNCHED = 1916;

-- 5. Изведете имената на всички потънали в битка кораби, името и дата на провеждане на битките, в които те са потънали. 
--Подредете резултата по име на битката.
--SELECT OUTCOMES.SHIP, BATTLES.NAME, BATTLES.DATE
--FROM OUTCOMES INNER JOIN BATTLES
--ON OUTCOMES.BATTLE = BATTLES.NAME
--WHERE OUTCOMES.RESULT = 'SUNK'
--ORDER BY BATTLES.NAME;

-- 6. Намерете името, водоизместимостта и годината на пускане на вода на всички кораби, 
--които имат същото име като техния клас. 
--SELECT NAME, LAUNCHED, DISPLACEMENT
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--WHERE SHIPS.NAME = CLASSES.CLASS;

-- 7. Намерете всички класове кораби, от които няма пуснат на вода нито един кораб.
--SELECT *
--FROM CLASSES
--WHERE CLASSES.CLASS NOT IN (SELECT CLASSES.CLASS FROM CLASSES INNER JOIN SHIPS ON SHIPS.CLASS = CLASSES.CLASS);

-- 8. Изведете името, водоизместимостта и броя оръдия на корабите, участвали в битката ‘North Atlantic’, 
--а също и резултата от битката.
--SELECT NAME, DISPLACEMENT, CLASSES.NUMGUNS, OUTCOMES.RESULT
--FROM SHIPS INNER JOIN CLASSES
--ON SHIPS.CLASS = CLASSES.CLASS
--INNER JOIN OUTCOMES
--ON SHIPS.NAME = OUTCOMES.SHIP
--WHERE OUTCOMES.BATTLE = 'NORTH ATLANTIC';