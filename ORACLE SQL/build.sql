/*
Created: 08.04.2021
Modified: 29.04.2021
Project: Odzial_zarzadu_drog_miejskich
Model: Zarzad_drog_miejskich
Author: Damian Prochenka, Karol Chodowski
Database: Oracle 12c
*/


-- Create sequences section -------------------------------------------------

CREATE SEQUENCE ZarzadSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE PracownikSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE AdresSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE DrogaSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE PocztaSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE RemontSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE RealizacjaSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE StanowiskoSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE JezykSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE PrawoJazdySeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE KategoriaSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE PojazdSeq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

-- Create tables section -------------------------------------------------

-- Table Oddzialy_zarzad_drog_miejskich

CREATE TABLE Oddzialy_zarzad_drog_miejskich(
  Nr_zarzadu Integer NOT NULL,
  Nazwa Varchar2(40 ) NOT NULL,
  Data_zalozenia Date NOT NULL,
  Adres_strony_WWW Varchar2(100 ) NOT NULL,
  Nr_adresu Integer NOT NULL
)
/

-- Create indexes for table Oddzialy_zarzad_drog_miejskich

CREATE INDEX IX_Relationship15 ON Oddzialy_zarzad_drog_miejskich (Nr_adresu)
/

-- Add keys for table Oddzialy_zarzad_drog_miejskich

ALTER TABLE Oddzialy_zarzad_drog_miejskich ADD CONSTRAINT Zarzad_PK PRIMARY KEY (Nr_zarzadu)
/

-- Table Pracownicy

CREATE TABLE Pracownicy(
  Nr_pracownika Integer NOT NULL,
  Imie Varchar2(20 ) NOT NULL,
  Nazwisko Varchar2(30 ) NOT NULL,
  Plec Char(1 ) NOT NULL
        CHECK (Plec IN ('M','K')),
  Data_urodzenia Date NOT NULL,
  PESEL Char(11 ),
  Nr_telefonu Varchar2(12 ),
  Nr_zarzadu Integer NOT NULL,
  Nr_stanowiska Integer NOT NULL,
  Nr_adresu Integer NOT NULL
)
/

-- Create indexes for table Pracownicy

CREATE INDEX IX_Zatrudnia ON Pracownicy (Nr_zarzadu)
/

CREATE INDEX IX_Relationship5 ON Pracownicy (Nr_stanowiska)
/

CREATE INDEX IX_Relationship1 ON Pracownicy (Nr_adresu)
/

-- Add keys for table Pracownicy

ALTER TABLE Pracownicy ADD CONSTRAINT Pracownik_PK PRIMARY KEY (Nr_pracownika)
/

-- Table Remonty_rodzaje

CREATE TABLE Remonty_rodzaje(
  Nr_rodzaju_remontu Integer NOT NULL,
  Rodzaj_remontu Varchar2(50 ) NOT NULL
        CHECK (Rodzaj_remontu IN ('Przebudowy ulic', 'Remonty nawierzchni jezdni', 'Remonty chodnikow', 'Infrastruktura rowerowa', 'Oswietlenie', 'Sygnalizacje swietlne', 'Obiekty mostowe')),
  Opis_remontu Varchar2(800 )
)
/

-- Add keys for table Remonty_rodzaje

ALTER TABLE Remonty_rodzaje ADD CONSTRAINT Remont_PK PRIMARY KEY (Nr_rodzaju_remontu)
/

-- Table Pracownicy_fizyczni

CREATE TABLE Pracownicy_fizyczni(
  Nr_pracownika Integer NOT NULL,
  Flaga_kurs_maszyn_budowlanych Char(1 ) NOT NULL,
  Flaga_dodatkowe_ubezpieczenie Char(1 ) NOT NULL
)
/

-- Add keys for table Pracownicy_fizyczni

ALTER TABLE Pracownicy_fizyczni ADD CONSTRAINT Unique_Identifier1 PRIMARY KEY (Nr_pracownika)
/

-- Table Urzednicy

CREATE TABLE Urzednicy(
  Nr_pracownika Integer NOT NULL,
  Ukonczone_studia Varchar2(100 ),
  Flaga_znajomosc_excel Char(1 ) NOT NULL
)
/

-- Add keys for table Urzednicy

ALTER TABLE Urzednicy ADD CONSTRAINT Unique_Identifier2 PRIMARY KEY (Nr_pracownika)
/

-- Table Pojazdy

CREATE TABLE Pojazdy(
  Nr_pojazdu Integer NOT NULL,
  Marka Varchar2(20 ) NOT NULL,
  Rok_produkcji Char(4 ) NOT NULL,
  Nr_rejestracyjny Varchar2(10 ) NOT NULL,
  Rodzaj_pojazdu Varchar2(20 ) NOT NULL
        CHECK (Rodzaj_pojazdu IN ('Dostawczy', 'Koparka', 'Walec', 'Inny')),
  Nr_zarzadu Integer NOT NULL
)
/

-- Create indexes for table Pojazdy

CREATE INDEX IX_Zarzad_posiada_pojazd ON Pojazdy (Nr_zarzadu)
/

-- Add keys for table Pojazdy

ALTER TABLE Pojazdy ADD CONSTRAINT Pojazd_PK PRIMARY KEY (Nr_pojazdu)
/

-- Table Walce

CREATE TABLE Walce(
  Nr_pojazdu Integer NOT NULL,
  Ilosc_bebnow Integer NOT NULL,
  Flaga_wibracje Char(1 ) NOT NULL
)
/

-- Add keys for table Walce

ALTER TABLE Walce ADD CONSTRAINT Unique_Identifier5 PRIMARY KEY (Nr_pojazdu)
/

-- Table Koparki

CREATE TABLE Koparki(
  Nr_pojazdu Integer NOT NULL,
  Rodzaj_koparki Varchar2(20 ) NOT NULL,
  Pojemnosc_lyzki_L Integer NOT NULL
)
/

-- Add keys for table Koparki

ALTER TABLE Koparki ADD CONSTRAINT Unique_Identifier6 PRIMARY KEY (Nr_pojazdu)
/

-- Table Pojazdy_dostawcze

CREATE TABLE Pojazdy_dostawcze(
  Nr_pojazdu Integer NOT NULL,
  Max_ladownosc_kg Integer NOT NULL,
  Pojemnosc_m3 Integer NOT NULL,
  Flaga_winda Char(1 ) NOT NULL
)
/

-- Add keys for table Pojazdy_dostawcze

ALTER TABLE Pojazdy_dostawcze ADD CONSTRAINT Unique_Identifier7 PRIMARY KEY (Nr_pojazdu)
/

-- Table Drogi

CREATE TABLE Drogi(
  Nr_drogi Char(20 ) NOT NULL,
  Typ_drogi Varchar2(20 ) NOT NULL
        CHECK (Typ_drogi IN ('Krajowa', 'Wojewodzka', 'Powiatowa')),
  Dlugosc_drogi_m Integer NOT NULL,
  Nazwa_ulicy Varchar2(40 ),
  Nr_zarzadu Integer NOT NULL
)
/

-- Create indexes for table Drogi

CREATE INDEX IX_Posiada ON Drogi (Nr_zarzadu)
/

-- Add keys for table Drogi

ALTER TABLE Drogi ADD CONSTRAINT Unique_Identifier8 PRIMARY KEY (Nr_drogi)
/

-- Table and Columns comments section

COMMENT ON COLUMN Drogi.Nr_drogi IS 'Unikalny identyfikator drogi'
/
COMMENT ON COLUMN Drogi.Nazwa_ulicy IS 'Nazwa ulicy'
/

-- Table Pracownicy_fizyczni_Pojazdy

CREATE TABLE Pracownicy_fizyczni_Pojazdy(
  Data_obslugi Date NOT NULL,
  Nr_pojazdu Integer NOT NULL,
  Nr_pracownika Integer NOT NULL
)
/

-- Table and Columns comments section

COMMENT ON COLUMN Pracownicy_fizyczni_Pojazdy.Data_obslugi IS 'Data obsługi pojazdu'
/

-- Table Drogi_Remonty

CREATE TABLE Drogi_Remonty(
  Nr_drogi Char(20 ) NOT NULL,
  Nr_realizacji Integer NOT NULL
)
/

-- Table Adresy

CREATE TABLE Adresy(
  Nr_adresu Integer NOT NULL,
  Miasto Varchar2(20 ) NOT NULL,
  Ulica Varchar2(40 ) NOT NULL,
  Nr_lokalu Varchar2(10 ) NOT NULL,
  Nr_poczty Integer NOT NULL
)
/

-- Create indexes for table Adresy

CREATE INDEX IX_Relationship4 ON Adresy (Nr_poczty)
/

-- Add keys for table Adresy

ALTER TABLE Adresy ADD CONSTRAINT PK_Adresy PRIMARY KEY (Nr_adresu)
/

-- Table and Columns comments section

COMMENT ON TABLE Adresy IS 'Relacja Adresy'
/
COMMENT ON COLUMN Adresy.Nr_adresu IS 'Unikatowy identyfikator adresu [klucz główny]'
/
COMMENT ON COLUMN Adresy.Miasto IS 'Miasto'
/
COMMENT ON COLUMN Adresy.Ulica IS 'Ulica'
/
COMMENT ON COLUMN Adresy.Nr_lokalu IS 'Nr lokalu'
/

-- Table Poczty

CREATE TABLE Poczty(
  Nr_poczty Integer NOT NULL,
  Kod_pocztowy Char(6 ) NOT NULL,
  Poczta Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Poczty

ALTER TABLE Poczty ADD CONSTRAINT PK_Poczty PRIMARY KEY (Nr_poczty)
/

ALTER TABLE Poczty ADD CONSTRAINT Kod_pocztowy UNIQUE (Kod_pocztowy)
/

-- Table and Columns comments section

COMMENT ON TABLE Poczty IS 'Relacja słownikowa poczty'
/
COMMENT ON COLUMN Poczty.Nr_poczty IS 'Unikatowy identyfikator poczty'
/
COMMENT ON COLUMN Poczty.Kod_pocztowy IS 'Kod pocztowy'
/
COMMENT ON COLUMN Poczty.Poczta IS 'Lokalizacja poczty'
/

-- Table Stanowiska

CREATE TABLE Stanowiska(
  Nr_stanowiska Integer NOT NULL,
  Nazwa_stanowiska Varchar2(30 ) NOT NULL,
  Opis_stanowiska Varchar2(400 ) NOT NULL
)
/

-- Add keys for table Stanowiska

ALTER TABLE Stanowiska ADD CONSTRAINT PK_Stanowiska PRIMARY KEY (Nr_stanowiska)
/

ALTER TABLE Stanowiska ADD CONSTRAINT Nazwa_stanowiska UNIQUE (Nazwa_stanowiska)
/

-- Table and Columns comments section

COMMENT ON TABLE Stanowiska IS 'Relacja słownikowa stanowiska'
/
COMMENT ON COLUMN Stanowiska.Nazwa_stanowiska IS 'Nazwa stanowiska'
/
COMMENT ON COLUMN Stanowiska.Opis_stanowiska IS 'Opis stanowiska'
/

-- Table Prawa_jazdy

CREATE TABLE Prawa_jazdy(
  Nr_prawa_jazdy Integer NOT NULL,
  Data_wydania Date NOT NULL,
  Data_waznosci Date,
  Nr_pracownika Integer NOT NULL
)
/

-- Create indexes for table Prawa_jazdy

CREATE UNIQUE INDEX Posiada_prawo_jazdy ON Prawa_jazdy (Nr_pracownika)
/

-- Add keys for table Prawa_jazdy

ALTER TABLE Prawa_jazdy ADD CONSTRAINT PK_Prawa_jazdy PRIMARY KEY (Nr_prawa_jazdy)
/

-- Table and Columns comments section

COMMENT ON TABLE Prawa_jazdy IS 'Relacja prawa jazdy'
/
COMMENT ON COLUMN Prawa_jazdy.Nr_prawa_jazdy IS 'Unikatowy identyfikator prawa jazdy'
/
COMMENT ON COLUMN Prawa_jazdy.Data_wydania IS 'Data wydania prawa jazdy'
/
COMMENT ON COLUMN Prawa_jazdy.Data_waznosci IS 'Data ważności prawa jazdy'
/

-- Table Kategorie

CREATE TABLE Kategorie(
  Nr_kategorii Char(20 ) NOT NULL,
  Kod_kategorii Varchar2(4 ) NOT NULL,
  Opis_kategorii Varchar2(400 )
)
/

-- Add keys for table Kategorie

ALTER TABLE Kategorie ADD CONSTRAINT PK_Kategorie PRIMARY KEY (Nr_kategorii)
/

ALTER TABLE Kategorie ADD CONSTRAINT Kod_kategorii UNIQUE (Kod_kategorii)
/

-- Table and Columns comments section

COMMENT ON TABLE Kategorie IS 'Kategorie prawa jazdy'
/
COMMENT ON COLUMN Kategorie.Nr_kategorii IS 'Nr kategorii prawa jazdy'
/
COMMENT ON COLUMN Kategorie.Kod_kategorii IS 'Kod kategorii prawa jazdy'
/
COMMENT ON COLUMN Kategorie.Opis_kategorii IS 'Opis kategorii prawa jazdy'
/

-- Table Kategorie_Prawo_jazdy

CREATE TABLE Kategorie_Prawo_jazdy(
  Nr_prawa_jazdy Integer NOT NULL,
  Nr_kategorii Char(20 ) NOT NULL
)
/

-- Add keys for table Kategorie_Prawo_jazdy

ALTER TABLE Kategorie_Prawo_jazdy ADD CONSTRAINT PK_Kategorie_Prawo_jazdy PRIMARY KEY (Nr_prawa_jazdy,Nr_kategorii)
/

-- Table Jezyki

CREATE TABLE Jezyki(
  Nr_jezyka Integer NOT NULL,
  Kod_jezyka Char(3 ) NOT NULL,
  Nazwa_jezyka Varchar2(30 ) NOT NULL
)
/

-- Add keys for table Jezyki

ALTER TABLE Jezyki ADD CONSTRAINT PK_Jezyki PRIMARY KEY (Nr_jezyka)
/

ALTER TABLE Jezyki ADD CONSTRAINT Kod_jezyka UNIQUE (Kod_jezyka)
/

-- Table and Columns comments section

COMMENT ON TABLE Jezyki IS 'Relacja słownikowa języki'
/
COMMENT ON COLUMN Jezyki.Nr_jezyka IS 'Unikatowy identyfikator języka'
/
COMMENT ON COLUMN Jezyki.Kod_jezyka IS 'Kod języka'
/
COMMENT ON COLUMN Jezyki.Nazwa_jezyka IS 'Nazwa języka'
/

-- Table Znajomosc_jezykow

CREATE TABLE Znajomosc_jezykow(
  Nr_pracownika Integer NOT NULL,
  Nr_jezyka Integer NOT NULL
)
/

-- Add keys for table Znajomosc_jezykow

ALTER TABLE Znajomosc_jezykow ADD CONSTRAINT PK_Znajomosc_jezykow PRIMARY KEY (Nr_pracownika,Nr_jezyka)
/

-- Table Realizacje_remontow

CREATE TABLE Realizacje_remontow(
  Nr_realizacji Integer NOT NULL,
  Data_rozpoczecia Date NOT NULL,
  Budzet Number(12,2) NOT NULL,
  Data_zakonczenia Date,
  Nr_rodzaju_remontu Integer NOT NULL,
  Nr_zarzadu Integer NOT NULL
)
/

-- Create indexes for table Realizacje_remontow

CREATE UNIQUE INDEX IX_Relationship6 ON Realizacje_remontow (Nr_rodzaju_remontu)
/

CREATE INDEX IX_Relationship2 ON Realizacje_remontow (Nr_zarzadu)
/

-- Add keys for table Realizacje_remontow

ALTER TABLE Realizacje_remontow ADD CONSTRAINT PK_Realizacje_remontow PRIMARY KEY (Nr_realizacji)
/

-- Table and Columns comments section

COMMENT ON TABLE Realizacje_remontow IS 'Realizacja realizacje remontów'
/
COMMENT ON COLUMN Realizacje_remontow.Nr_realizacji IS 'Unikatowy identyfikator realizacji'
/
COMMENT ON COLUMN Realizacje_remontow.Data_rozpoczecia IS 'Data rozpoczęcia remontu'
/
COMMENT ON COLUMN Realizacje_remontow.Budzet IS 'Budżet na remont'
/
COMMENT ON COLUMN Realizacje_remontow.Data_zakonczenia IS 'Data zakończenia remontu'
/

-- Table Pojazdy_remontuja

CREATE TABLE Pojazdy_remontuja(
  Nr_pojazdu Integer NOT NULL,
  Nr_realizacji Integer NOT NULL
)
/

-- Add keys for table Pojazdy_remontuja

ALTER TABLE Pojazdy_remontuja ADD CONSTRAINT PK_Pojazdy_remontuja PRIMARY KEY (Nr_pojazdu,Nr_realizacji)
/

-- Table Pracownicy_remontuja

CREATE TABLE Pracownicy_remontuja(
  Nr_pracownika Integer NOT NULL,
  Nr_realizacji Integer NOT NULL,
  Data_od Date NOT NULL,
  Data_do Date
)
/

-- Add keys for table Pracownicy_remontuja

ALTER TABLE Pracownicy_remontuja ADD CONSTRAINT PK_Pracownicy_remontuja PRIMARY KEY (Nr_pracownika,Nr_realizacji,Data_od)
/

-- Trigger for sequence ZarzadSeq1 for column Nr_zarzadu in table Oddzialy_zarzad_drog_miejskich ---------
CREATE OR REPLACE TRIGGER ts_Oddzialy_zarzad_drog_miej_0 BEFORE INSERT
ON Oddzialy_zarzad_drog_miejskich FOR EACH ROW
BEGIN
  :new.Nr_zarzadu := ZarzadSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Oddzialy_zarzad_drog_mie_0 AFTER UPDATE OF Nr_zarzadu
ON Oddzialy_zarzad_drog_miejskich FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_zarzadu in table Oddzialy_zarzad_drog_miejskich as it uses sequence.');
END;
/

-- Trigger for sequence PracownikSeq1 for column Nr_pracownika in table Pracownicy ---------
CREATE OR REPLACE TRIGGER ts_Pracownicy_PracownikSeq1 BEFORE INSERT
ON Pracownicy FOR EACH ROW
BEGIN
  :new.Nr_pracownika := PracownikSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Pracownicy_PracownikSeq1 AFTER UPDATE OF Nr_pracownika
ON Pracownicy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_pracownika in table Pracownicy as it uses sequence.');
END;
/

-- Trigger for sequence RemontSeq1 for column Nr_rodzaju_remontu in table Remonty_rodzaje ---------
CREATE OR REPLACE TRIGGER ts_Remonty_rodzaje_RemontSeq1 BEFORE INSERT
ON Remonty_rodzaje FOR EACH ROW
BEGIN
  :new.Nr_rodzaju_remontu := RemontSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Remonty_rodzaje_RemontSeq1 AFTER UPDATE OF Nr_rodzaju_remontu
ON Remonty_rodzaje FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_rodzaju_remontu in table Remonty_rodzaje as it uses sequence.');
END;
/

-- Trigger for sequence PojazdSeq1 for column Nr_pojazdu in table Pojazdy ---------
CREATE OR REPLACE TRIGGER ts_Pojazdy_PojazdSeq1 BEFORE INSERT
ON Pojazdy FOR EACH ROW
BEGIN
  :new.Nr_pojazdu := PojazdSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Pojazdy_PojazdSeq1 AFTER UPDATE OF Nr_pojazdu
ON Pojazdy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_pojazdu in table Pojazdy as it uses sequence.');
END;
/

-- Trigger for sequence DrogaSeq1 for column Nr_drogi in table Drogi ---------
CREATE OR REPLACE TRIGGER ts_Drogi_DrogaSeq1 BEFORE INSERT
ON Drogi FOR EACH ROW
BEGIN
  :new.Nr_drogi := DrogaSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Drogi_DrogaSeq1 AFTER UPDATE OF Nr_drogi
ON Drogi FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_drogi in table Drogi as it uses sequence.');
END;
/

-- Trigger for sequence AdresSeq1 for column Nr_adresu in table Adresy ---------
CREATE OR REPLACE TRIGGER ts_Adresy_AdresSeq1 BEFORE INSERT
ON Adresy FOR EACH ROW
BEGIN
  :new.Nr_adresu := AdresSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Adresy_AdresSeq1 AFTER UPDATE OF Nr_adresu
ON Adresy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_adresu in table Adresy as it uses sequence.');
END;
/

-- Trigger for sequence PocztaSeq1 for column Nr_poczty in table Poczty ---------
CREATE OR REPLACE TRIGGER ts_Poczty_PocztaSeq1 BEFORE INSERT
ON Poczty FOR EACH ROW
BEGIN
  :new.Nr_poczty := PocztaSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Poczty_PocztaSeq1 AFTER UPDATE OF Nr_poczty
ON Poczty FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_poczty in table Poczty as it uses sequence.');
END;
/

-- Trigger for sequence StanowiskoSeq1 for column Nr_stanowiska in table Stanowiska ---------
CREATE OR REPLACE TRIGGER ts_Stanowiska_StanowiskoSeq1 BEFORE INSERT
ON Stanowiska FOR EACH ROW
BEGIN
  :new.Nr_stanowiska := StanowiskoSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Stanowiska_StanowiskoSeq1 AFTER UPDATE OF Nr_stanowiska
ON Stanowiska FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_stanowiska in table Stanowiska as it uses sequence.');
END;
/

-- Trigger for sequence PrawoJazdySeq1 for column Nr_prawa_jazdy in table Prawa_jazdy ---------
CREATE OR REPLACE TRIGGER ts_Prawa_jazdy_PrawoJazdySeq1 BEFORE INSERT
ON Prawa_jazdy FOR EACH ROW
BEGIN
  :new.Nr_prawa_jazdy := PrawoJazdySeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Prawa_jazdy_PrawoJazdySeq1 AFTER UPDATE OF Nr_prawa_jazdy
ON Prawa_jazdy FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_prawa_jazdy in table Prawa_jazdy as it uses sequence.');
END;
/

-- Trigger for sequence KategoriaSeq1 for column Nr_kategorii in table Kategorie ---------
CREATE OR REPLACE TRIGGER ts_Kategorie_KategoriaSeq1 BEFORE INSERT
ON Kategorie FOR EACH ROW
BEGIN
  :new.Nr_kategorii := KategoriaSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Kategorie_KategoriaSeq1 AFTER UPDATE OF Nr_kategorii
ON Kategorie FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_kategorii in table Kategorie as it uses sequence.');
END;
/

-- Trigger for sequence JezykSeq1 for column Nr_jezyka in table Jezyki ---------
CREATE OR REPLACE TRIGGER ts_Jezyki_JezykSeq1 BEFORE INSERT
ON Jezyki FOR EACH ROW
BEGIN
  :new.Nr_jezyka := JezykSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Jezyki_JezykSeq1 AFTER UPDATE OF Nr_jezyka
ON Jezyki FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_jezyka in table Jezyki as it uses sequence.');
END;
/

-- Trigger for sequence RealizacjaSeq1 for column Nr_realizacji in table Realizacje_remontow ---------
CREATE OR REPLACE TRIGGER ts_Realizacje_remontow_Reali_0 BEFORE INSERT
ON Realizacje_remontow FOR EACH ROW
BEGIN
  :new.Nr_realizacji := RealizacjaSeq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Realizacje_remontow_Real_0 AFTER UPDATE OF Nr_realizacji
ON Realizacje_remontow FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Nr_realizacji in table Realizacje_remontow as it uses sequence.');
END;
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE Pracownicy ADD FOREIGN KEY (Nr_zarzadu) REFERENCES Oddzialy_zarzad_drog_miejskich (Nr_zarzadu)
/



ALTER TABLE Pojazdy ADD FOREIGN KEY (Nr_zarzadu) REFERENCES Oddzialy_zarzad_drog_miejskich (Nr_zarzadu)
/



ALTER TABLE Drogi ADD FOREIGN KEY (Nr_zarzadu) REFERENCES Oddzialy_zarzad_drog_miejskich (Nr_zarzadu)
/



ALTER TABLE Adresy ADD FOREIGN KEY (Nr_poczty) REFERENCES Poczty (Nr_poczty)
/



ALTER TABLE Pracownicy ADD FOREIGN KEY (Nr_stanowiska) REFERENCES Stanowiska (Nr_stanowiska)
/



ALTER TABLE Prawa_jazdy ADD FOREIGN KEY (Nr_pracownika) REFERENCES Pracownicy_fizyczni (Nr_pracownika)
/



ALTER TABLE Kategorie_Prawo_jazdy ADD FOREIGN KEY (Nr_prawa_jazdy) REFERENCES Prawa_jazdy (Nr_prawa_jazdy)
/



ALTER TABLE Kategorie_Prawo_jazdy ADD FOREIGN KEY (Nr_kategorii) REFERENCES Kategorie (Nr_kategorii)
/



ALTER TABLE Znajomosc_jezykow ADD FOREIGN KEY (Nr_pracownika) REFERENCES Urzednicy (Nr_pracownika)
/



ALTER TABLE Znajomosc_jezykow ADD FOREIGN KEY (Nr_jezyka) REFERENCES Jezyki (Nr_jezyka)
/



ALTER TABLE Realizacje_remontow ADD FOREIGN KEY (Nr_rodzaju_remontu) REFERENCES Remonty_rodzaje (Nr_rodzaju_remontu)
/



ALTER TABLE Pojazdy_remontuja ADD FOREIGN KEY (Nr_pojazdu) REFERENCES Pojazdy (Nr_pojazdu)
/



ALTER TABLE Pojazdy_remontuja ADD FOREIGN KEY (Nr_realizacji) REFERENCES Realizacje_remontow (Nr_realizacji)
/



ALTER TABLE Pracownicy_remontuja ADD FOREIGN KEY (Nr_pracownika) REFERENCES Pracownicy (Nr_pracownika)
/



ALTER TABLE Pracownicy_remontuja ADD FOREIGN KEY (Nr_realizacji) REFERENCES Realizacje_remontow (Nr_realizacji)
/



ALTER TABLE Pracownicy ADD FOREIGN KEY (Nr_adresu) REFERENCES Adresy (Nr_adresu)
/



ALTER TABLE Oddzialy_zarzad_drog_miejskich ADD FOREIGN KEY (Nr_adresu) REFERENCES Adresy (Nr_adresu)
/



ALTER TABLE Realizacje_remontow ADD FOREIGN KEY (Nr_zarzadu) REFERENCES Oddzialy_zarzad_drog_miejskich (Nr_zarzadu)
/



ALTER TABLE Drogi_Remonty ADD FOREIGN KEY (Nr_realizacji) REFERENCES Realizacje_remontow (Nr_realizacji)
/





