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
	contrincanteuno INTEGER,
	contrincantedos INTEGER,
	puntosContrincanteUno INTEGER,
	puntosContrincanteDos INTEGER,
	juego1 ENUM ('TRUE','FALSE','IDLE'),
	juego2 ENUM ('TRUE','FALSE','IDLE'),
	estado1 ENUM ('TRUE','FALSE','IDLE'),
	estado2 ENUM ('TRUE','FALSE','IDLE'),
	ganador VARCHAR(40),
	PRIMARY KEY (id),
	FOREIGN KEY (contrincanteuno) REFERENCES User(id) on delete cascade,
	FOREIGN KEY (contrincantedos) REFERENCES User(id) on delete cascade
);
CREATE TABLE UserEtakemons (
	id INTEGER AUTO_INCREMENT NOT NULL,
	iduser INTEGER NOT NULL,
	idetakemon INTEGER NOT NULL,
	FOREIGN KEY (idUser) REFERENCES User(id) on delete cascade,
	FOREIGN KEY (idEtakemon) REFERENCES Etakemons(id) on delete cascade,
	PRIMARY KEY (id)
);
CREATE TABLE EtakemonsDescription (
	id INTEGER AUTO_INCREMENT NOT NULL,
	idetakemon INTEGER NOT NULL,
	descripcion VARCHAR(1000),
	FOREIGN KEY (idetakemon) REFERENCES Etakemons(id) on delete cascade,
	PRIMARY KEY (id)
);
