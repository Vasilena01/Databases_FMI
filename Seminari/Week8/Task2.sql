--use pc;

--4. ����������� ��� INSERT ������. ��������� � ������ ����� �����, �� ���������� �������� ����� 1100 � �������� �� 
--������������� C, ��� �������� 2400 MHz, RAM 2048 MB, ����� ���� 500 GB, 52x ������� ������� ���������� � ������ $299. 
--���� ������ �������� ��� ��� 12. ���������: ����� � CD �� �� ��� ���.
--INSERT INTO PC
--VALUES (12, 1100, 2400, 2048, 500, '52x', 299);

--5. �� �� ������ ��������� ���������� � ��������� PC �� �������� ����� 1100.
--DELETE FROM PC
--WHERE MODEL = 1100;

--6. �� �� ������� �� ��������� Laptop ������ �������, ��������� �� ������������, ����� �� ���������� ��������.
--DELETE FROM LAPTOP
--WHERE MODEL IN (SELECT MODEL FROM PRODUCT 
--	WHERE MAKER NOT IN (SELECT MAKER FROM PRODUCT WHERE TYPE = 'PRINTER'));

--7. ������������ � ������ ������������ B. �� ������ �������� �� � ��������� ������������� �� ���� �.
--UPDATE PRODUCT
--SET MAKER = 'A'
--WHERE MAKER = 'B';

--8. �� �� ������ ���������� ������ �� ����� �������� � �� �� ������� �� 20 GB ��� ����� ����� ����.
--UPDATE PC
--SET PRICE=PRICE/2,
--	HD=HD+20;

--9. �� ����� ������ �� ������������ B �������� �� ���� ��� ��� ��������� �� ������.
--UPDATE LAPTOP
--SET SCREEN=SCREEN+1
--WHERE MODEL = (SELECT MODEL 
--				FROM PRODUCT WHERE MAKER = 'B');