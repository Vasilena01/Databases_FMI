--use movies;

--1. Да се вмъкне информация за актрисата Nicole Kidman. За нея знаем само, че е родена на 20.06.1967.
--INSERT INTO MOVIESTAR (NAME, BIRTHDATE)
--VALUES ('NICOLE KIDMAN', '1967-06-20');

--2. Да се изтрият всички продуценти с нетни активи под 30 милиона.
--DELETE FROM MOVIEEXEC
--WHERE NETWORTH < 30000000;

--3. Да се изтрие информацията за всички филмови звезди, за които не се знае адреса.
--DELETE FROM MOVIESTAR
--WHERE ADDRESS IS NULL;
