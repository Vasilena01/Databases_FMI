--1. �������� ���� ������ num_pass ��� ��������� Flights, ����� �� ������� ���� ��
--���������, ���������� ���������� �� ���������� �����.

--ALTER TABLE Flights
--ADD num_pass INT;

--ALTER TABLE Flights
--ADD CONSTRAINT check_num_pass CHECK (num_pass >= 0);

--UPDATE Flights
--SET num_pass = (SELECT COUNT(*)
--FROM BOOKINGS
--WHERE Flights.FNUMBER = BOOKINGS.FLIGHT_NUMBER AND STATUS = 1);

--2. �������� ���� ������ num_book ��� ��������� Agencies, ����� �� ������� ���� ��
--������������ ��� ����������� �������

--ALTER TABLE Agencies
--ADD num_book INT;

--ALTER TABLE AGENCIES
--ADD CONSTRAINT check_num_book CHECK (num_book >= 0);

--UPDATE AGENCIES
--SET num_book = (SELECT COUNT(*)
-- FROM BOOKINGS
-- WHERE AGENCIES.name = BOOKINGS.AGENCY AND STATUS = 1);

--3. �������� ������ �� ��������� Bookings, ����� �� �� ��������� ��� �������� �� ���������� � ��������� 
--� �� ��������� � ������� ���� �� ���������, ���������� ���������� �� ��������� Flights, 
--����� � ���� �� ������������ ��� ����������� �������.

--CREATE TRIGGER trigger_on_new_passenger
--ON BOOKINGS
--AFTER INSERT
--AS
--UPDATE F
--SET F.num_pass = F.num_pass + 1
--FROM FLIGHTS F
--INNER JOIN INSERTED I ON F.FNUMBER = I.FLIGHT_NUMBER
--UPDATE A
--SET A.num_book = A.num_book + 1
--FROM AGENCIES A
--INNER JOIN INSERTED I ON A.NAME = I.AGENCY;

-- 4. �������� ������ �� ��������� Bookings, ����� �� �� ��������� ��� ��������� �� ���������� � ��������� 
-- � �� �������� � ������� ���� �� ���������, ���������� ���������� �� ��������� Flights, 
-- ����� � ���� �� ������������ ��� ����������� �������.

--CREATE TRIGGER tr_on_passengers_delete
--ON BOOKINGS
--AFTER DELETE
--AS
--UPDATE F
--SET F.num_pass = F.num_pass - 1
--FROM Flights F
--INNER JOIN DELETED D ON F.FNUMBER = D.FLIGHT_NUMBER
--UPDATE A
--SET A.num_book = A.num_book + 1
--FROM AGENCIES A
--INNER JOIN DELETED I ON A.NAME = D.AGENCY;

-- 5. �������� ������ �� ��������� Bookings, ����� �� �� ��������� ��� ���������� �� ���������� � 
--��������� � �� ��������� ��� �������� � ������� ���� �� ���������,
--���������� ���������� �� ��������� Flights ��� ������� �� ������� �� ������������.

CREATE TRIGGER trigger_on_booking_status_change
ON BOOKINGS
AFTER UPDATE
AS
UPDATE F
SET F.num_pass = F.num_pass + 1
FROM FLIGHTS F
INNER JOIN INSERTED I ON I.FLIGHT_NUMBER = F.FNUMBER
INNER JOIN DELETED D ON D.FLIGHT_NUMBER = F.FNUMBER
WHERE I.STATUS = 1 AND D.STATUS = 0
UPDATE F
SET F.num_pass = F.num_pass - 1
FROM FLIGHTS F
INNER JOIN INSERTED I ON I.FLIGHT_NUMBER = F.FNUMBER
INNER JOIN DELETED D ON D.FLIGHT_NUMBER = F.FNUMBER
WHERE I.STATUS = 0 AND D.STATUS = 1;