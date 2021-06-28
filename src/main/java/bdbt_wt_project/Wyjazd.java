package bdbt_wt_project;

public class Wyjazd {

    private java.sql.Date data_obslugi;
    private int nr_pracownika;
    private String nazwisko;
    private String imie;
    private int nr_pojazdu;
    private String nr_rejestracyjny;
    private String marka;
    private String rodzaj_pojazdu;

    public Wyjazd() {
    }

    public Wyjazd(java.sql.Date data_obslugi, int nr_pracownika, String nazwisko, String imie, int nr_pojazdu, String nr_rejestracyjny, String marka, String rodzaj_pojazdu) {
        this.data_obslugi = data_obslugi;
        this.nr_pracownika = nr_pracownika;
        this.nazwisko = nazwisko;
        this.imie = imie;
        this.nr_pojazdu = nr_pojazdu;
        this.nr_rejestracyjny = nr_rejestracyjny;
        this.marka = marka;
        this.rodzaj_pojazdu = rodzaj_pojazdu;
    }

    public java.sql.Date getData_obslugi() {
        return data_obslugi;
    }

    public void setData_obslugi(java.sql.Date data_obslugi) {
        this.data_obslugi = data_obslugi;
    }

    public int getNr_pracownika() {
        return nr_pracownika;
    }

    public void setNr_pracownika(int nr_pracownika) {
        this.nr_pracownika = nr_pracownika;
    }

    public String getNazwisko() {
        return nazwisko;
    }

    public void setNazwisko(String nazwisko) {
        this.nazwisko = nazwisko;
    }

    public String getImie() {
        return imie;
    }

    public void setImie(String imie) {
        this.imie = imie;
    }

    public int getNr_pojazdu() {
        return nr_pojazdu;
    }

    public void setNr_pojazdu(int nr_pojazdu) {
        this.nr_pojazdu = nr_pojazdu;
    }

    public String getNr_rejestracyjny() {
        return nr_rejestracyjny;
    }

    public void setNr_rejestracyjny(String nr_rejestracyjny) {
        this.nr_rejestracyjny = nr_rejestracyjny;
    }

    public String getMarka() {
        return marka;
    }

    public void setMarka(String marka) {
        this.marka = marka;
    }

    public String getRodzaj_pojazdu() {
        return rodzaj_pojazdu;
    }

    public void setRodzaj_pojazdu(String rodzaj_pojazdu) {
        this.rodzaj_pojazdu = rodzaj_pojazdu;
    }

    @Override
    public String toString() {
        return "Wyjazd{" +
                "data_obslugi='" + data_obslugi + '\'' +
                ", nr_pracownika=" + nr_pracownika +
                ", nazwisko='" + nazwisko + '\'' +
                ", imie='" + imie + '\'' +
                ", nr_pojazdu=" + nr_pojazdu +
                ", nr_rejestracyjny='" + nr_rejestracyjny + '\'' +
                ", marka='" + marka + '\'' +
                ", rodzaj_pojazdu='" + rodzaj_pojazdu + '\'' +
                '}';
    }
}
