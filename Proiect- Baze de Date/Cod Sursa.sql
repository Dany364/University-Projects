CREATE DATABASE IF NOT EXISTS PlatformaRezervari_ERD_DB;
USE PlatformaRezervari_ERD_DB;

CREATE TABLE Locatii (
    idLocatie SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    oras TINYTEXT NOT NULL,
    localitate TINYTEXT NOT NULL,
    strada VARCHAR(20) NOT NULL,
    numar TINYINT NOT NULL,

    PRIMARY KEY (idLocatie)
);

CREATE TABLE Clienti (
    idClient INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nume TINYTEXT NOT NULL,
    prenume TINYTEXT NOT NULL,
    cnpClient VARCHAR(13) NULL,
    adresaClient TINYTEXT NULL,
    telefonClient VARCHAR(20) NOT NULL,
    emailClient TINYTEXT NULL,
    dataCont DATE NOT NULL,
    numeCont VARCHAR(30) NOT NULL,
    parolaCont VARCHAR(20) NOT NULL,

    PRIMARY KEY (idClient),
    UNIQUE (cnpClient),
    UNIQUE (numeCont)
);

CREATE TABLE Hoteluri (
    idHotel INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipHotel TINYTEXT NOT NULL,
    numeHotel VARCHAR(50) NULL,
    telefonHotel VARCHAR(20) NULL,
    capacitateHotel SMALLINT UNSIGNED NULL,
    facilitatiHotel TEXT NULL,
    idLocatie SMALLINT UNSIGNED NOT NULL,

    PRIMARY KEY (idHotel),

    CONSTRAINT fk_Hoteluri_Locatii
        FOREIGN KEY (idLocatie)
        REFERENCES Locatii(idLocatie)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE Camere (
    idCamera INT UNSIGNED NOT NULL AUTO_INCREMENT,
    numarCamera VARCHAR(10) NOT NULL,
    tipCamera VARCHAR(50) NULL,
    etajCamera TINYINT UNSIGNED NULL,
    pretNoapte SMALLINT UNSIGNED NOT NULL,
    facilitatiCamera TEXT NULL,
    idHotel INT UNSIGNED NOT NULL,

    PRIMARY KEY (idCamera),

    CONSTRAINT fk_Camere_Hoteluri
        FOREIGN KEY (idHotel)
        REFERENCES Hoteluri(idHotel)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Perioade (
    idPerioada BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    dataCheckIn DATE NOT NULL,
    dataCheckOut DATE NOT NULL,
    idClient INT UNSIGNED NOT NULL,

    PRIMARY KEY (idPerioada),

    CONSTRAINT fk_Perioade_Clienti
        FOREIGN KEY (idClient)
        REFERENCES Clienti(idClient)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT chk_date_valide
        CHECK (dataCheckOut > dataCheckIn)
);

CREATE TABLE RezervariHotel (
    idRezervareHotel INT UNSIGNED NOT NULL AUTO_INCREMENT,

    numarPersoaneHotel TINYINT UNSIGNED NOT NULL,
    pretNoapte SMALLINT UNSIGNED NOT NULL,
    statusRezervareHotel VARCHAR(20) NOT NULL,

    idPerioada BIGINT UNSIGNED NOT NULL,
    idClient INT UNSIGNED NOT NULL,
    idCamera INT UNSIGNED NOT NULL,

    PRIMARY KEY (idRezervareHotel),

    CONSTRAINT fk_RezervariHotel_Perioade
        FOREIGN KEY (idPerioada)
        REFERENCES Perioade(idPerioada)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_RezervariHotel_Clienti
        FOREIGN KEY (idClient)
        REFERENCES Clienti(idClient)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_RezervariHotel_Camere
        FOREIGN KEY (idCamera)
        REFERENCES Camere(idCamera)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Restaurante (
    idRestaurant INT UNSIGNED NOT NULL AUTO_INCREMENT,
    specificRestaurant VARCHAR(10) NULL,
    capacitateRestaurant SMALLINT UNSIGNED NULL,
    telefonRestaurant VARCHAR(20) NOT NULL,
    emailRestaurant VARCHAR(20) NULL,

    idLocatie SMALLINT UNSIGNED NOT NULL,
    idHotel INT UNSIGNED NULL,

    PRIMARY KEY (idRestaurant),

    CONSTRAINT fk_Restaurante_Locatii
        FOREIGN KEY (idLocatie)
        REFERENCES Locatii(idLocatie)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_Restaurante_Hoteluri
        FOREIGN KEY (idHotel)
        REFERENCES Hoteluri(idHotel)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Recenzii (
    idRecenzie MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    comentariu TEXT NULL,
    rating TINYINT UNSIGNED NULL,
    dataRecenzie DATE NOT NULL,

    idClient INT UNSIGNED NOT NULL,
    idHotel INT UNSIGNED NULL,
    idRestaurant INT UNSIGNED NULL,

    PRIMARY KEY (idRecenzie),

    CONSTRAINT fk_Recenzii_Clienti
        FOREIGN KEY (idClient)
        REFERENCES Clienti(idClient)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_Recenzii_Hoteluri
        FOREIGN KEY (idHotel)
        REFERENCES Hoteluri(idHotel)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_Recenzii_Restaurante
        FOREIGN KEY (idRestaurant)
        REFERENCES Restaurante(idRestaurant)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT chk_rating
        CHECK (rating BETWEEN 1 AND 5)
);

CREATE TABLE RezervariRestaurante (
    idRezervareRestaurant INT UNSIGNED NOT NULL AUTO_INCREMENT,

    oraSosirii TIME NOT NULL,
    numarPersoaneRestaurant TINYINT UNSIGNED NOT NULL,
    statusRezervareRestaurant TINYTEXT NOT NULL,

    idPerioada BIGINT UNSIGNED NOT NULL,
    idRestaurant INT UNSIGNED NOT NULL,

    PRIMARY KEY (idRezervareRestaurant),

    CONSTRAINT fk_RezervariRestaurante_Perioade
        FOREIGN KEY (idPerioada)
        REFERENCES Perioade(idPerioada)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_RezervariRestaurante_Restaurante
        FOREIGN KEY (idRestaurant)
        REFERENCES Restaurante(idRestaurant)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Mese (
    idMasa INT UNSIGNED NOT NULL AUTO_INCREMENT,

    nrPersoaneMasa TINYINT UNSIGNED NOT NULL,
    idRestaurant INT UNSIGNED NOT NULL,
    idRezervareRestaurant INT UNSIGNED NOT NULL,

    PRIMARY KEY (idMasa),

    CONSTRAINT fk_Mese_Restaurante
        FOREIGN KEY (idRestaurant)
        REFERENCES Restaurante(idRestaurant)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_Mese_RezervariRestaurante
        FOREIGN KEY (idRezervareRestaurant)
        REFERENCES RezervariRestaurante(idRezervareRestaurant)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Locatii (oras, localitate, strada, numar) VALUES
('Bucuresti', 'Centru', 'Unirii', 10),
('Constanta', 'Mamaia', 'Mamaia', 15),
('Brasov', 'Centru', 'Republicii', 20),
('Iasi', 'Pacurari', 'Pacurari', 12),
('Cluj-Napoca', 'Centru', 'Motilor', 8),
('Focsani', 'Sud', 'Independentei', 5),
('Corabia', 'Nord', 'Libertatii', 3),
('Predeal', 'Centru', 'Victoriei', 17),
('Constanta', 'Eforie Nord', 'Trandafirilor', 9),
('Constanta', 'Saturn', 'Lalelelor', 14);



INSERT INTO Clienti
(nume, prenume, cnpClient, adresaClient,
 telefonClient, emailClient, dataCont,
 numeCont, parolaCont)
VALUES
('Popescu', 'Ion', '5010101223344', 'Bucuresti',
'0711111111', 'ion@email.com', '2024-01-10',
'ionpop', 'parola1'),

('Ionescu', 'Maria', '6020202334455', 'Brasov',
'0722222222', 'maria@email.com', '2024-02-11',
'mariai', 'parola2'),

('Georgescu', 'Andrei', '5030303445566', 'Cluj',
'0733333333', 'andrei@email.com', '2024-03-12',
'andreig', 'parola3'),

('Dumitru', 'Elena', '6040404556677', 'Iasi',
'0744444444', 'elena@email.com', '2024-04-13',
'elenad', 'parola4'),

('Stan', 'Mihai', '5050505667788', 'Constanta',
'0755555555', 'mihai@email.com', '2024-05-14',
'mihais', 'parola5'),

('Matei', 'Ana', '6060606778899', 'Predeal',
'0766666666', 'ana@email.com', '2024-06-15',
'anam', 'parola6'),

('Radu', 'Paul', '5070707889900', 'Focsani',
'0777777777', 'paul@email.com', '2024-07-16',
'paulr', 'parola7'),

('Enache', 'Ioana', '6080808990011', 'Corabia',
'0788888888', 'ioana@email.com', '2024-08-17',
'ioanae', 'parola8'),

('Barbu', 'Cristian', '5090909001122', 'Mamaia',
'0799999999', 'cristi@email.com', '2024-09-18',
'cristib', 'parola9'),

('Marin', 'Laura', '6001010112233', 'Eforie',
'0700000000', 'laura@email.com', '2024-10-19',
'lauram', 'parola10');



INSERT INTO Hoteluri
(tipHotel, numeHotel, telefonHotel,
 capacitateHotel, facilitatiHotel, idLocatie)
VALUES
('Lux', 'Hotel Royal', '0211111111', 150, 'Piscina', 1),
('Boutique', 'Sea View', '0222222222', 80, 'Mic dejun', 2),
('Hostel', 'Mountain Hostel', '0233333333', 40, 'WiFi', 3),
('Pensiune', 'Casa Iasi', '0244444444', 30, 'Parcare', 4),
('Lux', 'Grand Cluj', '0255555555', 200, 'Spa', 5),
('Motel', 'Transit Motel', '0266666666', 25, 'Restaurant', 6),
('Complex', 'Danube Resort', '0277777777', 300, 'Piscina', 7),
('Boutique', 'Predeal View', '0288888888', 60, 'Spa', 8),
('Apartament', 'Eforie Apartments', '0299999999', 20, 'Bucatarie', 9),
('Pensiune', 'Saturn Inn', '0200000000', 35, 'Terasa', 10);



INSERT INTO Camere
(numarCamera, tipCamera, etajCamera,
 pretNoapte, facilitatiCamera, idHotel)
VALUES
('101', 'Single', 1, 250, 'TV', 1),
('102', 'Double', 1, 350, 'AC', 1),
('201', 'Suite', 2, 600, 'Jacuzzi', 2),
('202', 'Single', 2, 220, 'WiFi', 2),
('301', 'Double', 3, 300, 'Balcon', 3),
('302', 'Suite', 3, 700, 'Piscina', 4),
('401', 'Single', 4, 180, 'TV', 5),
('402', 'Double', 4, 320, 'AC', 6),
('501', 'Suite', 5, 900, 'Spa', 7),
('502', 'Single', 5, 210, 'WiFi', 8);



INSERT INTO Perioade
(dataCheckIn, dataCheckOut, idClient)
VALUES
('2025-06-01', '2025-06-05', 1),
('2025-06-02', '2025-06-07', 2),
('2025-06-03', '2025-06-06', 3),
('2025-06-04', '2025-06-08', 4),
('2025-06-05', '2025-06-10', 5),
('2025-06-06', '2025-06-09', 6),
('2025-06-07', '2025-06-11', 7),
('2025-06-08', '2025-06-12', 8),
('2025-06-09', '2025-06-13', 9),
('2025-06-10', '2025-06-15', 10);



INSERT INTO RezervariHotel
(numarPersoaneHotel,
 pretNoapte,
 statusRezervareHotel,
 idPerioada,
 idClient,
 idCamera)
VALUES
(2, 250, 'Confirmata', 1, 1, 1),
(3, 350, 'Confirmata', 2, 2, 2),
(1, 600, 'Anulata', 3, 3, 3),
(2, 220, 'Confirmata', 4, 4, 4),
(4, 300, 'Confirmata', 5, 5, 5),
(2, 700, 'Confirmata', 6, 6, 6),
(1, 180, 'Anulata', 7, 7, 7),
(2, 320, 'Confirmata', 8, 8, 8),
(3, 900, 'Confirmata', 9, 9, 9),
(1, 210, 'Confirmata', 10, 10, 10);



INSERT INTO Restaurante
(specificRestaurant,
 capacitateRestaurant,
 telefonRestaurant,
 emailRestaurant,
 idLocatie,
 idHotel)
VALUES
('Italian', 100, '0311111111', 'royal@r.com', 1, 1),
('Japonez', 80, '0322222222', 'sushi@r.com', 2, 2),
('Tradi', 120, '0333333333', 'trad@r.com', 3, 3),
('Chinezesc', 90, '0344444444', 'china@r.com', 4, 4),
('Japonez', 70, '0355555555', 'tokyo@r.com', 5, 5),
('Turcesc', 60, '0366666666', 'turcia@r.com', 6, 6),
('Italian', 110, '0377777777', 'pizza@r.com', 7, 7),
('Japonez', 50, '0388888888', 'sakura@r.com', 8, 8),
('Tradi', 130, '0399999999', 'roman@r.com', 9, 9),
('Chinezesc', 75, '0300000000', 'dragon@r.com', 10, 10);



INSERT INTO Recenzii
(comentariu,
 rating,
 dataRecenzie,
 idClient,
 idHotel,
 idRestaurant)
VALUES
('Foarte bun', 5, '2025-06-01', 1, 1, 1),
('Servicii excelente', 4, '2025-06-02', 2, 2, 2),
('Curatenie buna', 5, '2025-06-03', 3, 3, 3),
('Personal amabil', 4, '2025-06-04', 4, 4, 4),
('Experienta placuta', 5, '2025-06-05', 5, 5, 5),
('Mancare excelenta', 5, '2025-06-06', 6, 6, 6),
('Camera mica', 3, '2025-06-07', 7, 7, 7),
('Foarte frumos', 4, '2025-06-08', 8, 8, 8),
('Pret bun', 5, '2025-06-09', 9, 9, 9),
('Recomand', 5, '2025-06-10', 10, 10, 10);



INSERT INTO RezervariRestaurante
(oraSosirii,
 numarPersoaneRestaurant,
 statusRezervareRestaurant,
 idPerioada,
 idRestaurant)
VALUES
('18:00:00', 2, 'Confirmata', 1, 1),
('19:00:00', 4, 'Confirmata', 2, 2),
('20:00:00', 3, 'Anulata', 3, 3),
('18:30:00', 2, 'Confirmata', 4, 4),
('21:00:00', 5, 'Confirmata', 5, 5),
('17:00:00', 2, 'Confirmata', 6, 6),
('19:30:00', 6, 'Anulata', 7, 7),
('20:30:00', 3, 'Confirmata', 8, 8),
('18:15:00', 4, 'Confirmata', 9, 9),
('22:00:00', 2, 'Confirmata', 10, 10);



INSERT INTO Mese
(nrPersoaneMasa,
 idRestaurant,
 idRezervareRestaurant)
VALUES
(2, 1, 1),
(4, 2, 2),
(3, 3, 3),
(2, 4, 4),
(5, 5, 5),
(2, 6, 6),
(6, 7, 7),
(3, 8, 8),
(4, 9, 9),
(2, 10, 10);
