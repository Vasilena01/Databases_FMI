--use pc;
--use ships;

-- 1. �������� ��������/� ������/� ����� ��������� Product �� ������ �� ����� PC.
--CREATE CLUSTERED INDEX indx_product
--ON product(model);

-- 2. �������� ��������� ������� ����� ��������� Classes, Ships, Battles, Outcomes �� ������ �� ����� Ships.
--CREATE CLUSTERED INDEX indx_battles
--ON battles(name);

--CREATE NONCLUSTERED INDEX index_classes
--ON classes(class, country);

--CREATE NONCLUSTERED INDEX indx_ships
--ON ships(name, class);

--CREATE NONCLUSTERED INDEX indx_outcomes
--ON outcomes(ship, battle, result);

-- Delete all created indicies
--DROP INDEX indx_battles ON BATTLES;
--DROP INDEX index_classes ON CLASSES;
--DROP INDEX indx_ships ON SHIPS;
--DROP INDEX indx_outcomes ON OUTCOMES;