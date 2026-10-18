-- 1. Poliklinik Tablosu
CREATE TABLE Poliklinik (
    Poliklinik_ID INT PRIMARY KEY AUTO_INCREMENT,
    Poliklinik_Adi VARCHAR(100) NOT NULL
);

-- 2. Doktor Tablosu (Kural 1: 1:N İlişki)
CREATE TABLE Doktor (
    Doktor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    Poliklinik_ID INT,
    FOREIGN KEY (Poliklinik_ID) REFERENCES Poliklinik(Poliklinik_ID)
);

-- 3. Hasta Tablosu
CREATE TABLE Hasta (
    Hasta_ID INT PRIMARY KEY AUTO_INCREMENT,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    TC_Kimlik CHAR(11) UNIQUE
);

-- 4. Muayene Tablosu (Kural 2: Hasta ve Poliklinik arası N:M İlişki)
CREATE TABLE Muayene (
    Muayene_ID INT PRIMARY KEY AUTO_INCREMENT,
    Hasta_ID INT,
    Poliklinik_ID INT,
    Muayene_Tarihi DATETIME,
    FOREIGN KEY (Hasta_ID) REFERENCES Hasta(Hasta_ID),
    FOREIGN KEY (Poliklinik_ID) REFERENCES Poliklinik(Poliklinik_ID)
);

-- 5. Laboratuvar Tablosu
CREATE TABLE Laboratuvar (
    Laboratuvar_ID INT PRIMARY KEY AUTO_INCREMENT,
    Laboratuvar_Adi VARCHAR(100) NOT NULL
);

-- 6. Tahlil Tablosu (Kural 4: Tahlil ve Laboratuvar arası 1:N İlişki)
CREATE TABLE Tahlil (
    Tahlil_ID INT PRIMARY KEY AUTO_INCREMENT,
    Tahlil_Adi VARCHAR(100) NOT NULL,
    Laboratuvar_ID INT,
    FOREIGN KEY (Laboratuvar_ID) REFERENCES Laboratuvar(Laboratuvar_ID)
);

-- 7. Hasta Tahlil İşlemleri (Kural 3: Hasta, Tahlil ve Doktor arası N:M İlişki)
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

-- 8. Servis Tablosu (Kural 6: Servis ve Poliklinik arası 1:N İlişki)
CREATE TABLE Servis (
    Servis_ID INT PRIMARY KEY AUTO_INCREMENT,
    Servis_Adi VARCHAR(100) NOT NULL,
    Poliklinik_ID INT,
    FOREIGN KEY (Poliklinik_ID) REFERENCES Poliklinik(Poliklinik_ID)
);

-- 9. Hemşire Tablosu (Kural 5: Hemşire ve Servis arası 1:N İlişki)
CREATE TABLE Hemsire (
    Hemsire_ID INT PRIMARY KEY AUTO_INCREMENT,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    Servis_ID INT,
    FOREIGN KEY (Servis_ID) REFERENCES Servis(Servis_ID)
);
