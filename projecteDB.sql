DROP DATABASE IF EXISTS projecteDB;
CREATE DATABASE projecteDB;
USE projecteDB;
CREATE TABLE User (
	id INTEGER AUTO_INCREMENT NOT NULL,
	name VARCHAR(40) NOT NULL,
	surname VARCHAR(40) NOT NULL,
	nick VARCHAR(40) UNIQUE NOT NULL,
	email VARCHAR(40) NOT NULL,
	password VARCHAR(20) NOT NULL,
	totalEtakemons INTEGER,
	puntuacionTotal INTEGER,
	PRIMARY KEY (id)
);
CREATE TABLE Etakemons (
	id INTEGER AUTO_INCREMENT NOT NULL,
	name VARCHAR(40) UNIQUE NOT NULL,
	tipo ENUM ('director','alumno','profesor')NOT NULL,
	puntos INTEGER,
	descripcion VARCHAR(100),
	PRIMARY KEY (id)
);
CREATE TABLE Fight (
	id INTEGER AUTO_INCREMENT NOT NULL,
	ContrincanteUno INTEGER,
	ContrincanteDos INTEGER,
	puntosContrincanteUno INTEGER,
	puntosContrincanteDos INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (ContrincanteUno) REFERENCES User(id) on delete cascade,
	FOREIGN KEY (ContrincanteDos) REFERENCES User(id) on delete cascade
);
CREATE TABLE UserEtakemons (
	id INTEGER AUTO_INCREMENT NOT NULL,
	iduser INTEGER NOT NULL,
	idetakemon INTEGER NOT NULL,
	FOREIGN KEY (idUser) REFERENCES User(id) on delete cascade,
	FOREIGN KEY (idEtakemon) REFERENCES Etakemons(id) on delete cascade,
	PRIMARY KEY (id)
);
