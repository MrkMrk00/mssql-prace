-- 1) Vybere kódy všech cest, na kterých je, bylo nebo bude nějaké dopravní omezení.
--		výběrové + podmínka
SELECT DISTINCT c.kod FROM cesta c WHERE c.id IN (SELECT id_cesta FROM dopravni_omezeni);

-- 2) Vybere všechna dopravní omezení, která platí v současné době.
--		výběrové + funkce
SELECT * FROM dopravni_omezeni do 
WHERE 
	do.trvani_od >= GETDATE()
	AND do.trvani_do <= GETDATE();

-- 3) Vybere nejpozdejší termín dokončení, nejstarší začátek omezení a nejdelší omezení v dnech.
--		výběrové + agregace
SELECT 
	MAX(trvani_do) AS nejpozdejsi_termin_dokonceni,
	MIN(trvani_od) AS nejstarsi_omezeni,
	MAX(DATEDIFF(day, trvani_od, trvani_do)) AS nejdelssi_omezeni_dni
FROM dopravni_omezeni;

-- 4) Vybere cestu, na které bylo nejdelší dopravní omezení.
SELECT * 
FROM cesta c
	WHERE c.id IN (
		SELECT TOP 1 do.id_cesta 
		FROM dopravni_omezeni do 
		ORDER BY DATEDIFF(day, do.trvani_od, do.trvani_do) DESC
	);

-- 5) Odstranění omezení s koncem před 1. 2. 2024.
--		akční + odstraňovací
DELETE FROM dopravni_omezeni WHERE trvani_do < '2024-02-01';


-- 6) Zvýší důležitost nejdéle trvajícího omezení o 1.
-- 		akční + aktualizační
UPDATE duvod_omezeni
SET dulezitost = dulezitost + 1
WHERE id IN (
	SELECT TOP 1 id_duvod
	FROM dopravni_omezeni
	ORDER BY DATEDIFF(day, trvani_od, trvani_do) DESC
)


-- 7) Průměrné délky omezení pro jednotlivé subjekty.
SELECT 
	prumerne_delky.prumerna_delka_omezeni,
	s.nazev AS odpovedny_subjekt
	FROM (
		SELECT 
			AVG(do.km_do - do.km_od) AS prumerna_delka_omezeni,
			do.odpovedny_subjekt
			FROM dopravni_omezeni do
			GROUP BY do.odpovedny_subjekt
		) prumerne_delky
	JOIN subjekty s ON s.id = odpovedny_subjekt;

-- 8) Počet omezení pro jednotlivé důvody.
SELECT 
	COUNT(do.id) AS pocet_omezeni,
	d.id AS duvod_id
	FROM dopravni_omezeni do
	JOIN duvod_omezeni d ON d.id = do.id_duvod
	GROUP BY d.id;

-- 9) Počet omezení pro jednotlivé subjekty.
SELECT 
	COUNT(do.id) AS pocet_omezeni,
	s.id AS subjekt_id
	FROM dopravni_omezeni do
	JOIN subjekty s ON s.id = do.odpovedny_subjekt
	GROUP BY s.id;


-- 10) Počet omezení pro jednotlivé cesty.
SELECT 
	COUNT(do.id) AS pocet_omezeni,
	c.id AS cesta_id
	FROM dopravni_omezeni do
	JOIN cesta c ON c.id = do.id_cesta
	GROUP BY c.id;

-- 11) Počet omezení pro jednotlivé cesty, které mají alespoň 4 omezení.
SELECT 
	COUNT(do.id) AS pocet_omezeni,
	c.id AS cesta_id
	FROM dopravni_omezeni do
	JOIN cesta c ON c.id = do.id_cesta
	GROUP BY c.id
	HAVING COUNT(do.id) >= 4;

