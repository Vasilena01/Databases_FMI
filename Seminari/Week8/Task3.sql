--USE SHIPS;

--10. ��� ��������� ����� ������ �� ����� Nelson - Nelson � Rodney - �� ���� ������� �� ���� ������������ 
--���� 1927 �. ����� �� ����� 16-������ ������ (bore) � ��������������� �� 34000 ���� (displacement). 
--�������� ���� ����� ��� ������ �� �����.
--INSERT INTO SHIPS (NAME, CLASS, LAUNCHED)
--VALUES ('Nelson', 'Nelson', 1927), ('Rodney', 'Nelson', 1927)
--INSERT INTO CLASSES (NUMGUNS, BORE, DISPLACEMENT, CLASS, TYPE, COUNTRY)
--VALUES (9, 16, 34000, 'Nelson', 'bb', 'Gt.Britain')

--11. �������� �� ��������� Ships ������ ������, ����� �� �������� � �����.
--DELETE FROM SHIPS
--WHERE NAME IN (SELECT SHIP FROM OUTCOMES WHERE RESULT = 'SUNK');

--12. ��������� ������� � ��������� Classes ����, �� ��������� (bore) �� �� ������� � ���������� 
--(� ������� � � ������, 1 ��� ~ 2.5 ��) � ����������������� �� �� ������� � �������� ������ (1 �.�. = 1.1 �.)
--UPDATE CLASSES
--SET BORE=BORE*2.5, 
--	DISPLACEMENT=DISPLACEMENT*1.1;