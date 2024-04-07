CREATE TABLE cesta (
	id		INT		NOT NULL IDENTITY PRIMARY KEY,
	trida	VARCHAR(8)	NOT NULL DEFAULT "3",
	kod 	VARCHAR(10) NOT NULL,
	obec_z  VARCHAR(255) NOT NULL,
	obec_do VARCHAR(255) NOT NULL,
);

CREATE TABLE subjekty (
	id INT NOT NULL IDENTITY PRIMARY KEY,
	nazev VARCHAR(255) NOT NULL,
	ico VARCHAR(8) NOT NULL
);

CREATE TABLE duvod_omezeni (
	id					INT		NOT NULL IDENTITY PRIMARY KEY,
	nazev				TEXT	NOT NULL,
	popis				TEXT,
	dulezitost			INT		NOT NULL,
);

CREATE TABLE dopravni_omezeni (
	id			INT			 NOT NULL IDENTITY PRIMARY KEY,
	id_cesta	INT			 NOT NULL,
	id_duvod	INT			 NOT NULL,
	km_od		FLOAT(24)	 NOT NULL,
	km_do		FLOAT(24) 	 NOT NULL,
	trvani_od	DATETIME	 NOT NULL,
	trvani_do	DATETIME	 NOT NULL,
	odpovedny_subjekt	INT,

	FOREIGN KEY (id_cesta) REFERENCES cesta(id)
		ON DELETE CASCADE,

	FOREIGN KEY (id_duvod) REFERENCES duvod_omezeni(id)
		ON DELETE CASCADE,

	FOREIGN KEY (odpovedny_subjekt) REFERENCES subjekty(id)
		ON DELETE CASCADE
);

GO
