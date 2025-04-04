?--�� ������ �� ����� SHIPS
USE ships;

--1. �������� ������, ����� ������� ����� � �������� �� ������ ������� � ������� �� 10 ������.

SELECT CLASS, COUNTRY
FROM CLASSES
WHERE NUMGUNS < 10;

--2. �������� ������, ����� ������� ������� �� ��������, ������� �� ����
--����� 1918. ������� ��������� shipName �� ��������.

SELECT NAME as shipName
FROM SHIPS
WHERE LAUNCHED < 1918

--3. �������� ������, ����� ������� ������� �� �������� �������� � ����� �
--������� �� ����������� �����.

SELECT SHIP, BATTLE
FROM OUTCOMES
WHERE RESULT = 'sunk'

--4. �������� ������, ����� ������� ������� �� �������� � ���, ���������
--� ����� �� ������ ����.

SELECT NAME
FROM SHIPS
WHERE NAME = CLASS

--5. �������� ������, ����� ������� ������� �� ��������, ����� �������� �
--������� R.

SELECT NAME
FROM SHIPS
WHERE NAME LIKE 'R%'

--6. �������� ������, ����� ������� ������� �� ��������, ����� �������� 2
--��� ������ ����.

SELECT NAME
FROM SHIPS
WHERE NAME LIKE '% %'