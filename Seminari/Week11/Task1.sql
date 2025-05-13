--use FLIGHTS;

-- 1. �������� ������, ����� ������� ��� �� ������������, �������� �� ������, 
--����� �� ����� � ���� �������, ���������� ���������� �� ���� �����.

--CREATE VIEW v_flight_info(airline_operator, flight_number, name, status)
--AS
--SELECT AIRLINE_OPERATOR, FNUMBER, AIRLINES.NAME, SUM(B.STATUS)
--FROM FLIGHTS INNER JOIN AIRLINES
--ON AIRLINES.CODE = AIRLINE_OPERATOR
--INNER JOIN BOOKINGS AS B
--ON FNUMBER = B.FLIGHT_NUMBER
--GROUP BY B.STATUS, AIRLINE_OPERATOR, AIRLINES.NAME, FNUMBER
--HAVING B.STATUS = '1';

-- 2. �������� ������, ����� �� ����� ������� ������� ����� �� ������� � ���-����� ����������.
--CREATE VIEW v_max_client_reservations
--(agency_name, client_name)
--AS
--SELECT B.AGENCY, C.FNAME
--FROM BOOKINGS AS B
--INNER JOIN CUSTOMERS AS C
--ON B.CUSTOMER_ID = C.ID
--WHERE B.STATUS = 1
--GROUP BY B.AGENCY, C.FNAME
--HAVING COUNT(C.ID) >= ALL(SELECT COUNT(C2.ID)
--						FROM BOOKINGS AS B2 INNER JOIN CUSTOMERS AS C2
--						ON B2.CUSTOMER_ID = C2.ID
--						WHERE B2.AGENCY = B.AGENCY AND B2.STATUS = '1'
--						GROUP BY C2.ID);

-- 3. �������� ������ �� ��������� Agencies, ����� ������� ������ ����� �� ��������� �� ���� �����.
--����������� ������a � CHECK OPTION.
--CREATE VIEW v_SF_Agencies
--(agency_name, country, city, phone)
--AS
--SELECT *
--FROM AGENCIES
--WHERE CITY = 'SOFIA'
--WITH CHECK OPTION;

-- 4. �������� ������ �� ��������� Agencies, ����� ������� ������ ����� �� ���������, ������ �� 
--����������� ������ �� ���� ������� �� ���� �������� NULL. 
-- ����������� ������a � CHECK OPTION.
--CREATE VIEW v_SF_PH_Agencies
--(agency_name, country, city, phone)
--AS
--SELECT *
--FROM AGENCIES
--WHERE PHONE IS NULL
--WITH CHECK OPTION;

--INSERT INTO v_SF_Agencies  VALUES('T1 Tour', 'Bulgaria', 'Sofia','+359'); ok
--INSERT INTO v_SF_PH_Agencies  VALUES('T2 Tour', 'Bulgaria', 'Sofia',null); ok
--INSERT INTO v_SF_Agencies  VALUES('T3 Tour', 'Bulgaria', 'Varna','+359'); fails
--INSERT INTO v_SF_PH_Agencies  VALUES('T4 Tour', 'Bulgaria', 'Varna',null); ok
--INSERT INTO v_SF_PH_Agencies  VALUES('T4 Tour', 'Bulgaria', 'Sofia','+359'); fails

-- Delete all created views
--DROP VIEW v_flight_info;
--DROP VIEW v_max_client_reservations;
--DROP VIEW v_SF_Agencies;
--DROP VIEW v_SF_PH_Agencies;