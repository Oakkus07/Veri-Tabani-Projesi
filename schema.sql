CREATE TABLE Poliklinik (
    Poliklinik_ID INT PRIMARY KEY AUTO_INCREMENT,
    Poliklinik_Adi VARCHAR(100) NOT NULL
);

CREATE TABLE Doktor (
    Doktor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    Poliklinik_ID INT,
    FOREIGN KEY (Poliklinik_ID) REFERENCES Poliklinik(Poliklinik_ID)
);

CREATE TABLE Hasta (
    Hasta_ID INT PRIMARY KEY AUTO_INCREMENT,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    TC_Kimlik CHAR(11) UNIQUE
);

CREATE TABLE Muayene (
    Muayene_ID INT PRIMARY KEY AUTO_INCREMENT,
    Hasta_ID INT,
    Poliklinik_ID INT,
    Muayene_Tarihi DATETIME,
    FOREIGN KEY (Hasta_ID) REFERENCES Hasta(Hasta_ID),
    FOREIGN KEY (Poliklinik_ID) REFERENCES Poliklinik(Poliklinik_ID)
);

CREATE TABLE Laboratuvar (
    Laboratuvar_ID INT PRIMARY KEY AUTO_INCREMENT,
    Laboratuvar_Adi VARCHAR(100) NOT NULL
);

CREATE TABLE Tahlil (
    Tahlil_ID INT PRIMARY KEY AUTO_INCREMENT,
    Tahlil_Adi VARCHAR(100) NOT NULL,
    Laboratuvar_ID INT,
    FOREIGN KEY (Laboratuvar_ID) REFERENCES Laboratuvar(Laboratuvar_ID)
);

CREATE TABLE Hasta_Tahlil (
    Islem_ID INT PRIMARY KEY AUTO_INCREMENT,
    Hasta_ID INT,
    Doktor_ID INT,
    Tahlil_ID INT,
    Istek_Tarihi DATETIME,
    FOREIGN KEY (Hasta_ID) REFERENCES Hasta(Hasta_ID),
    FOREIGN KEY (Doktor_ID) REFERENCES Doktor(Doktor_ID),
    FOREIGN KEY (Tahlil_ID) REFERENCES Tahlil(Tahlil_ID)
);

CREATE TABLE Servis (
    Servis_ID INT PRIMARY KEY AUTO_INCREMENT,
    Servis_Adi VARCHAR(100) NOT NULL,
    Poliklinik_ID INT,
    FOREIGN KEY (Poliklinik_ID) REFERENCES Poliklinik(Poliklinik_ID)
);

CREATE TABLE Hemsire (
    Hemsire_ID INT PRIMARY KEY AUTO_INCREMENT,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    Servis_ID INT,
    FOREIGN KEY (Servis_ID) REFERENCES Servis(Servis_ID)
);
