
-- 12) Vloží data do tabulky cesta
--		přidávací
SET IDENTITY_INSERT cesta ON;

INSERT INTO cesta(id, trida, kod, obec_z, obec_do)
VALUES 
(1, "1", "I/2", "Praha", "Pardubice"),
(2, "1", "I/6", "Nové Stračecí", "Pomezí nad Ohří"),
(3, "D", "D10", "Praha", "Turnov"),
(4, "R", "R10", "Turnov", "Liberec"),
(5, "D", "D11", "Praha", "Jaroměř"),
(6, "2", "II/295", "Špindlerův Mlýn", "Studenec");

SET IDENTITY_INSERT cesta OFF;


-- 13) Vloží data do tabulky subjekty
--		přidávací
SET IDENTITY_INSERT subjekty ON;

INSERT INTO subjekty(id, nazev, ico)
VALUES
(1, "Metrostav", "12345678"),
(2, "Skanska", "87654321"),
(3, "Hochtief", "12348765"),
(4, "OHL", "87651234"),
(5, "Strabag", "12345678"),
(6, "Alpine", "87654321");

SET IDENTITY_INSERT subjekty OFF;


-- 14) Vloží data do tabulky duvod_omezeni
--		přidávací
SET IDENTITY_INSERT duvod_omezeni ON;

INSERT INTO duvod_omezeni(id, nazev, popis, dulezitost)
VALUES 
(1, "Rekonstrukce", "Rekonstrukce mostu", 1),
(2, "Oprava", "Oprava vozovky", 2),
(3, "Výstavba", NULL, 3),
(4, "Omezení", "Omezení provozu", 4),
(5, "Omezení", "Omezení provozu", 4),
(6, "Omezení", "Omezení provozu", 4);

SET IDENTITY_INSERT duvod_omezeni OFF;

-- 15) Vloží data do tabulky dopravni_omezeni
--		přidávací
SET IDENTITY_INSERT dopravni_omezeni ON;

INSERT INTO dopravni_omezeni(id, id_cesta, id_duvod, km_od, km_do, trvani_od, trvani_do, odpovedny_subjekt)
VALUES
(1, 1, 1, 0, 10, "2024-01-01 00:00:00", "2024-01-31 23:59:59", 1),
(2, 1, 2, 10, 20, "2024-02-01 00:00:00", "2024-02-28 23:59:59", 2),
(3, 1, 3, 20, 30, "2024-03-01 00:00:00", "2024-03-31 23:59:59", 3),
(4, 1, 4, 30, 40, "2024-04-01 00:00:00", "2024-04-30 23:59:59", 4),
(5, 1, 5, 40, 50, "2024-05-01 00:00:00", "2024-05-31 23:59:59", 5),
(6, 1, 6, 50, 60, "2024-06-01 00:00:00", "2024-06-30 23:59:59", 6),
(7, 2, 1, 0, 10, "2024-01-01 00:00:00", "2024-01-31 23:59:59", 1),
(8, 2, 2, 10, 20, "2024-02-01 00:00:00", "2024-02-28 23:59:59", 2),
(9, 2, 3, 20, 30, "2024-03-01 00:00:00", "2024-03-31 23:59:59", 3),
(10, 2, 4, 30, 40, "2024-04-01 00:00:00", "2024-04-30 23:59:59", 4);

SET IDENTITY_INSERT dopravni_omezeni OFF;
GO
