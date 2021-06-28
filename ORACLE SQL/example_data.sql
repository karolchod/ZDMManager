INSERT INTO poczty (kod_pocztowy,poczta) VALUES ('00665','Warszawa');
INSERT INTO poczty (kod_pocztowy,poczta) VALUES ('05303','Miñsk Mazowiecki');
INSERT INTO poczty (kod_pocztowy,poczta) VALUES ('08110','Siedlce');
INSERT INTO poczty (kod_pocztowy,poczta) VALUES ('05400','Otwock');
INSERT INTO poczty (kod_pocztowy,poczta) VALUES ('05802','Pruszków');

INSERT INTO stanowiska (nazwa_stanowiska,opis_stanowiska) VALUES ('Kierownik oddzialu','Osoba zarzadzajaca praca oddzialu');
INSERT INTO stanowiska (nazwa_stanowiska,opis_stanowiska) VALUES ('Ksiegowy','Pracownik dzialu ksiegowosci');
INSERT INTO stanowiska (nazwa_stanowiska,opis_stanowiska) VALUES ('Sekretarz','Pracownik sekretariatu');
INSERT INTO stanowiska (nazwa_stanowiska,opis_stanowiska) VALUES ('Mechanik','Osoba odpowiedzialna za stan maszyn');
INSERT INTO stanowiska (nazwa_stanowiska,opis_stanowiska) VALUES ('Inzynier budowy','Osoba zarzadzajaca przebiegiem budowy');
INSERT INTO stanowiska (nazwa_stanowiska,opis_stanowiska) VALUES ('Pracownik budowlany','Pracownik wykonujacy prace fizyczne na budowie');

INSERT INTO jezyki (kod_jezyka,nazwa_jezyka) VALUES ('pol','polski');
INSERT INTO jezyki (kod_jezyka,nazwa_jezyka) VALUES ('eng','angielski');
INSERT INTO jezyki (kod_jezyka,nazwa_jezyka) VALUES ('rus','rosyjski');
INSERT INTO jezyki (kod_jezyka,nazwa_jezyka) VALUES ('ger','niemiecki');

INSERT INTO remonty_rodzaje (rodzaj_remontu,opis_remontu) VALUES ('Przebudowy ulic','Zmiana ukladu drogi');
INSERT INTO remonty_rodzaje (rodzaj_remontu,opis_remontu) VALUES ('Remonty nawierzchni jezdni','Wypelnienie ubytkow');
INSERT INTO remonty_rodzaje (rodzaj_remontu,opis_remontu) VALUES ('Oswietlenie','Wymiana zarowek');
INSERT INTO remonty_rodzaje (rodzaj_remontu,opis_remontu) VALUES ('Remonty nawierzchni jezdni','Malowanie oznakowania');

INSERT INTO kategorie (kod_kategorii,opis_kategorii) VALUES ('B','samochody do 3,5 t, pojazdy wolnobiezne');
INSERT INTO kategorie (kod_kategorii,opis_kategorii) VALUES ('C','pojazd ciezarowy ponad 3,5 t');
INSERT INTO kategorie (kod_kategorii,opis_kategorii) VALUES ('D','autobus');
INSERT INTO kategorie (kod_kategorii,opis_kategorii) VALUES ('T','ciagnik rolniczy');

INSERT INTO adresy (miasto,ulica,nr_lokalu, nr_poczty) VALUES ('Warszawa','Nowowiejska','15/19',1);
INSERT INTO adresy (miasto,ulica,nr_lokalu, nr_poczty) VALUES ('Stok Lacki','Kolejowa','100',3);
INSERT INTO adresy (miasto,ulica,nr_lokalu, nr_poczty) VALUES ('Otwock','Warszawska','35',4);
INSERT INTO adresy (miasto,ulica,nr_lokalu, nr_poczty) VALUES ('Warszawa','Blokowa','156',1);

INSERT
    INTO oddzialy_zarzad_drog_miejskich (
        nazwa,
        data_zalozenia,
        adres_strony_www,
        nr_adresu
    )
VALUES (
    'Zarzad Drog Miejskich w Warszawie',
    TO_DATE('1/05/1994', 'DD/MM/YYYY'),
    'www.zdmwarszawa.pl',
    1
    );

INSERT INTO drogi(typ_drogi, dlugosc_drogi_m, nazwa_ulicy, nr_zarzadu) VALUES ('Powiatowa',1500,'Mazowiecka',1);
INSERT INTO drogi(typ_drogi, dlugosc_drogi_m, nazwa_ulicy, nr_zarzadu) VALUES ('Powiatowa',8500,'Sloneczna',1);
INSERT INTO drogi(typ_drogi, dlugosc_drogi_m, nr_zarzadu) VALUES ('Wojewodzka',25000,1);
INSERT INTO drogi(typ_drogi, dlugosc_drogi_m, nazwa_ulicy, nr_zarzadu) VALUES ('Powiatowa',500,'Lesna',1);

INSERT INTO realizacje_remontow (
    data_rozpoczecia,
    budzet,
    nr_rodzaju_remontu,
    nr_zarzadu
) VALUES (
    TO_DATE('20/04/2021', 'DD/MM/YYYY'),
    100000,
    1,
    1
);

INSERT INTO realizacje_remontow (
    data_rozpoczecia,
    budzet,
    data_zakonczenia,
    nr_rodzaju_remontu,
    nr_zarzadu
) VALUES (
    TO_DATE('25/03/2021', 'DD/MM/YYYY'),
    100000,
    TO_DATE('10/04/2021', 'DD/MM/YYYY'),
    3,
    1
);

INSERT INTO drogi_remonty(nr_drogi,nr_realizacji) VALUES (1,1);
INSERT INTO drogi_remonty(nr_drogi,nr_realizacji) VALUES (3,2);

INSERT INTO pracownicy (
    imie,
    nazwisko,
    plec,
    data_urodzenia,
    nr_telefonu,
    nr_zarzadu,
    nr_stanowiska,
    nr_adresu
) VALUES (
    'Stanislaw',
    'Chmura',
    'M',
    TO_DATE('24/11/1990', 'DD/MM/YYYY'),
    '+48500633200',
    1,
    2,
    4
);

INSERT INTO pracownicy (
    imie,
    nazwisko,
    plec,
    data_urodzenia,
    nr_telefonu,
    nr_zarzadu,
    nr_stanowiska,
    nr_adresu
) VALUES (
    'Stanislawa',
    'Chmurowska',
    'K',
    TO_DATE('26/01/1985', 'DD/MM/YYYY'),
    '+48658952358',
    1,
    5,
    4
);

INSERT INTO pracownicy (
    imie,
    nazwisko,
    plec,
    data_urodzenia,
    PESEL,
    nr_zarzadu,
    nr_stanowiska,
    nr_adresu
) VALUES (
    'Kazimierz',
    'Waligora',
    'M',
    TO_DATE('27/05/1995', 'DD/MM/YYYY'),
    '95052758726',
    1,
    6,
    2
);

INSERT INTO pracownicy (
    imie,
    nazwisko,
    plec,
    data_urodzenia,
    nr_telefonu,
    nr_zarzadu,
    nr_stanowiska,
    nr_adresu
) VALUES (
    'Stanislaw',
    'Kapuczina',
    'M',
    TO_DATE('29/05/1954', 'DD/MM/YYYY'),
    '+48500500500',
    1,
    4,
    3
);

INSERT INTO pracownicy (
    imie,
    nazwisko,
    plec,
    data_urodzenia,
    nr_telefonu,
    nr_zarzadu,
    nr_stanowiska,
    nr_adresu
) VALUES (
    'Rafal',
    'Kapuczina',
    'M',
    TO_DATE('29/05/1986', 'DD/MM/YYYY'),
    '+48500500501',
    1,
    4,
    3
);

INSERT INTO pracownicy (
    imie,
    nazwisko,
    plec,
    data_urodzenia,
    nr_telefonu,
    nr_zarzadu,
    nr_stanowiska,
    nr_adresu
) VALUES (
    'Mateusz',
    'Trombka',
    'M',
    TO_DATE('29/05/1986', 'DD/MM/YYYY'),
    '+48500500501',
    1,
    6,
    3
);

INSERT INTO pracownicy_remontuja (nr_pracownika,nr_realizacji,data_od,data_do) VALUES (11,2,TO_DATE('27/03/2021', 'DD/MM/YYYY'),TO_DATE('10/04/2021', 'DD/MM/YYYY'));
INSERT INTO pracownicy_remontuja (nr_pracownika,nr_realizacji,data_od,data_do) VALUES (10,2,TO_DATE('25/03/2021', 'DD/MM/YYYY'),TO_DATE('10/04/2021', 'DD/MM/YYYY'));
INSERT INTO pracownicy_remontuja (nr_pracownika,nr_realizacji,data_od) VALUES (11,1,TO_DATE('20/04/2021', 'DD/MM/YYYY'));
INSERT INTO pracownicy_remontuja (nr_pracownika,nr_realizacji,data_od) VALUES (14,1,TO_DATE('22/04/2021', 'DD/MM/YYYY'));

INSERT INTO urzednicy (nr_pracownika,ukonczone_studia,flaga_znajomosc_excel) VALUES (9,'Uniwersytet Warszawski, ksiegowosc','1');
INSERT INTO urzednicy (nr_pracownika,ukonczone_studia,flaga_znajomosc_excel) VALUES (10,'Politechnika Warszawska, budownictwo','0');

INSERT INTO znajomosc_jezykow (nr_pracownika,nr_jezyka) VALUES (9,1);
INSERT INTO znajomosc_jezykow (nr_pracownika,nr_jezyka) VALUES (10,1);
INSERT INTO znajomosc_jezykow (nr_pracownika,nr_jezyka) VALUES (10,2);

INSERT INTO pracownicy_fizyczni (nr_pracownika,flaga_kurs_maszyn_budowlanych,flaga_dodatkowe_ubezpieczenie) VALUES (11,1,0);
INSERT INTO pracownicy_fizyczni (nr_pracownika,flaga_kurs_maszyn_budowlanych,flaga_dodatkowe_ubezpieczenie) VALUES (12,0,0);
INSERT INTO pracownicy_fizyczni (nr_pracownika,flaga_kurs_maszyn_budowlanych,flaga_dodatkowe_ubezpieczenie) VALUES (13,0,1);
INSERT INTO pracownicy_fizyczni (nr_pracownika,flaga_kurs_maszyn_budowlanych,flaga_dodatkowe_ubezpieczenie) VALUES (14,1,1);

INSERT INTO prawa_jazdy (data_wydania,data_waznosci,nr_pracownika) VALUES (TO_DATE('20/06/2010', 'DD/MM/YYYY'),TO_DATE('22/04/2030', 'DD/MM/YYYY'),14);
INSERT INTO prawa_jazdy (data_wydania,nr_pracownika) VALUES (TO_DATE('25/02/1978', 'DD/MM/YYYY'),12);

INSERT INTO kategorie_prawo_jazdy (nr_prawa_jazdy,nr_kategorii) VALUES (1,1);
INSERT INTO kategorie_prawo_jazdy (nr_prawa_jazdy,nr_kategorii) VALUES (2,1);
INSERT INTO kategorie_prawo_jazdy (nr_prawa_jazdy,nr_kategorii) VALUES (2,2);
INSERT INTO kategorie_prawo_jazdy (nr_prawa_jazdy,nr_kategorii) VALUES (2,4);

INSERT INTO pojazdy (
    marka,
    rok_produkcji,
    nr_rejestracyjny,
    rodzaj_pojazdu,
    nr_zarzadu
) VALUES (
    'Caterpillar',
    '2005',
    'W0 KOPAJ',
    'Koparka',
    1
);

INSERT INTO pojazdy (
    marka,
    rok_produkcji,
    nr_rejestracyjny,
    rodzaj_pojazdu,
    nr_zarzadu
) VALUES (
    'VOLKSWAGEN',
    '1995',
    'WI 25889',
    'Dostawczy',
    1
);

INSERT INTO pojazdy (
    marka,
    rok_produkcji,
    nr_rejestracyjny,
    rodzaj_pojazdu,
    nr_zarzadu
) VALUES (
    'Hamm',
    '1998',
    'WI 14785',
    'Walec',
    1
);

INSERT INTO pojazdy (
    marka,
    rok_produkcji,
    nr_rejestracyjny,
    rodzaj_pojazdu,
    nr_zarzadu
) VALUES (
    'Jaguar',
    '2019',
    'W0 BOSS',
    'Inny',
    1
);

INSERT INTO koparki (nr_pojazdu,rodzaj_koparki,pojemnosc_lyzki_l) VALUES (1,'kolowa',1000);
INSERT INTO pojazdy_dostawcze (nr_pojazdu,max_ladownosc_kg,pojemnosc_m3,flaga_winda) VALUES (2,1000,3,'0');
INSERT INTO walce (nr_pojazdu,ilosc_bebnow,flaga_wibracje) VALUES (3,2,'0');

INSERT INTO pracownicy_fizyczni_pojazdy (nr_pojazdu,nr_pracownika,data_obslugi) VALUES (2,12,TO_DATE('30/03/2021', 'DD/MM/YYYY'));
INSERT INTO pracownicy_fizyczni_pojazdy (nr_pojazdu,nr_pracownika,data_obslugi) VALUES (2,12,TO_DATE('31/03/2010', 'DD/MM/YYYY'));
INSERT INTO pracownicy_fizyczni_pojazdy (nr_pojazdu,nr_pracownika,data_obslugi) VALUES (4,14,TO_DATE('27/04/2021', 'DD/MM/YYYY'));
INSERT INTO pracownicy_fizyczni_pojazdy (nr_pojazdu,nr_pracownika,data_obslugi) VALUES (3,14,TO_DATE('31/03/2021', 'DD/MM/YYYY'));

INSERT INTO pojazdy_remontuja (nr_pojazdu,nr_realizacji) VALUES (2,2);
INSERT INTO pojazdy_remontuja (nr_pojazdu,nr_realizacji) VALUES (3,2);


