USE master;
GO

IF EXISTS(SELECT * FROM sysdatabases WHERE name='Mensajeria')
BEGIN 
	RAISERROR('Dropping existing ProMsg database...', 0, 1)
	DROP DATABASE Mensajeria;
END
GO

CREATE DATABASE Mensajeria;
GO

USE Mensajeria;
GO

CREATE TABLE account
(
	account_id INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	username VARCHAR(45) NOT NULL,
	password_ VARCHAR(45) NOT NULL
);
GO

CREATE TABLE info_contact
(
	contact_id INT NOT NULL PRIMARY KEY IDENTITY(1001, 1),
    last_name VARCHAR(45) NOT NULL,
	first_name VARCHAR(45) NOT NULL,
    number VARCHAR(45) NOT NULL,
	contact_status VARCHAR(145) NOT NULL,
);
GO

CREATE TABLE bodychat
(
	account_id INT NOT NULL REFERENCES account (account_id),
	contact_id INT NOT NULL REFERENCES info_contact (contact_id),
	msg TEXT NOT NULL,

	PRIMARY KEY (account_id, contact_id)
);
GO

CREATE TABLE contact_account
(
	account_id INT NOT NULL REFERENCES account (account_id),
	contact_id INT NOT NULL REFERENCES info_contact (contact_id),

	PRIMARY KEY (account_id, contact_id)
);
GO

INSERT INTO account VALUES ('4622724770', '0000');
INSERT INTO account VALUES ('4621155415', '0000');
INSERT INTO account VALUES ('4646547825', '0000');
INSERT INTO account VALUES ('4626539264', '0000');
INSERT INTO account VALUES ('4621985340', '0000');
INSERT INTO account VALUES ('4621079873', '0000');
INSERT INTO account VALUES ('4566558148', '0000');
INSERT INTO account VALUES ('4621109729', '0000');
INSERT INTO account VALUES ('4641370369', '0000');

GO

INSERT INTO info_contact VALUES ('Santana',		'Adriana', '+52 1 462 282 4770', 'Hey there! I am using WhatsApp.');
INSERT INTO info_contact VALUES ('Porras',		'Gladys',  '+52 1 462 115 5415', 'Y así fue que me olvide de mí, tratando de hacerte feliz y en el intento me perdí y me dio miedo la distancia de no ser buena para ti');
INSERT INTO info_contact VALUES ('Jimenez',		'Miguel',  '+52 1 464 654 7825', 'You & Me is more than a hundred miles');
INSERT INTO info_contact VALUES ('Santamaría',	'Luis',		'+52 1 462 653 9264', 'She.');
INSERT INTO info_contact VALUES ('Lopez',		'Estefania','+52 1 462 198 5340', 'Estoy durmiendo.');
INSERT INTO info_contact VALUES ('Rosales',		'Saida',	'+52 1 462 107 9873', 'Arriba Saidaaaaaaa.!!!!');
INSERT INTO info_contact VALUES ('Mares',		'Lilian',   '+52 1 456 655 8148', 'Tengo todo perfectamente descontrolado');
INSERT INTO info_contact VALUES ('Retana',		'Alfonso',  '+52 1 464 137 0369', '...');
GO

INSERT INTO contact_account VALUES (1, 1010);
INSERT INTO contact_account VALUES (2, 1001);
GO