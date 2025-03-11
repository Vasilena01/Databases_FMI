--use pc;

-- 1. Напишете заявка, която извежда производител, модел и тип на продукт за тези производители, за които съответният 
--продукт не се продава (няма го в таблиците PC, Laptop или Printer)
--SELECT MAKER, PR.TYPE, PR.MODEL
--FROM PRODUCT AS PR
--LEFT JOIN (SELECT CODE, MODEL FROM PC
--			UNION SELECT CODE, MODEL FROM LAPTOP
--			UNION SELECT CODE, MODEL FROM PRINTER) AS REAL_PRODUCTS
--ON REAL_PRODUCTS.model = PR.model
--WHERE REAL_PRODUCTS.CODE IS NULL;

-- 2.Намерете всички производители, които правят както лаптопи, така и принтери.
--SELECT DISTINCT MAKER
--FROM PRODUCT 
--INNER JOIN PRINTER
--ON PRODUCT.MODEL = PRINTER.MODEL
--WHERE MAKER IN (SELECT MAKER FROM PRODUCT
--				INNER JOIN LAPTOP
--				ON PRODUCT.MODEL = LAPTOP.MODEL);

--SELECT MAKER
--FROM PRODUCT
--INNER JOIN PRINTER
--ON PRODUCT.MODEL = PRINTER.MODEL
--INTERSECT
--SELECT MAKER
--FROM PRODUCT
--INNER JOIN LAPTOP
--ON PRODUCT.MODEL = LAPTOP.MODEL;

-- 3. Намерете размерите на тези твърди дискове, които се появяват в два или повече модела лаптопи.
--SELECT DISTINCT L1.HD
--FROM LAPTOP AS L1 INNER JOIN LAPTOP AS L2
--ON L1.hd = L2.HD
--WHERE L1.CODE != L2.CODE;

--SELECT DISTINCT L1.HD
--FROM LAPTOP AS L1
--WHERE L1.HD IN (SELECT L2.HD FROM LAPTOP AS L2 WHERE L1.CODE != L2.CODE);

-- 4. Намерете всички модели персонални компютри, които нямат регистриран производител.
--SELECT *
--FROM PC LEFT JOIN PRODUCT
--ON PRODUCT.MODEL = PC.MODEL
--WHERE PRODUCT.MAKER IS NULL;