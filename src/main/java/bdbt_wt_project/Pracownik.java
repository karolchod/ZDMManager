package bdbt_wt_project;

public class Pracownik {

	private int nr_pracownika;
	private String nazwisko;
	private String imie;
	private String nr_telefonu;
	private boolean flaga_kurs_maszyn_budowlanych;
	private boolean flaga_dodatkowe_ubezpieczenie;


	public Pracownik() {

	}

	public Pracownik(int nr_pracownika, String nazwisko, String imie, String nr_telefonu, boolean flaga_kurs_maszyn_budowlanych, boolean flaga_dodatkowe_ubezpieczenie) {
		this.nr_pracownika = nr_pracownika;
		this.nazwisko = nazwisko;
		this.imie = imie;
		this.nr_telefonu = nr_telefonu;
		this.flaga_kurs_maszyn_budowlanych = flaga_kurs_maszyn_budowlanych;
		this.flaga_dodatkowe_ubezpieczenie = flaga_dodatkowe_ubezpieczenie;
	}

	public int getNr_pracownika() {
		return nr_pracownika;
	}

	public void setNr_pracownika(int nr_pracownika) {
		this.nr_pracownika = nr_pracownika;
	}

	public String getImie() {
		return imie;
	}

	public void setImie(String imie) {
		this.imie = imie;
	}

	public String getNazwisko() {
		return nazwisko;
	}

	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}

	public boolean isFlaga_kurs_maszyn_budowlanych() {
		return flaga_kurs_maszyn_budowlanych;
	}

	public void setFlaga_kurs_maszyn_budowlanych(boolean flaga_kurs_maszyn_budowlanych) {
		this.flaga_kurs_maszyn_budowlanych = flaga_kurs_maszyn_budowlanych;
	}

	public boolean isFlaga_dodatkowe_ubezpieczenie() {
		return flaga_dodatkowe_ubezpieczenie;
	}

	public void setFlaga_dodatkowe_ubezpieczenie(boolean flaga_dodatkowe_ubezpieczenie) {
		this.flaga_dodatkowe_ubezpieczenie = flaga_dodatkowe_ubezpieczenie;
	}

	public String getNr_telefonu() {
		return nr_telefonu;
	}

	public void setNr_telefonu(String nr_telefonu) {
		this.nr_telefonu = nr_telefonu;
	}

	@Override
	public String toString() {
		return "Pracownik{" +
				"nr_pracownika=" + nr_pracownika +
				", nazwisko='" + nazwisko + '\'' +
				", imie='" + imie + '\'' +
				", nr_telefonu='" + nr_telefonu + '\'' +
				", flaga_kurs_maszyn_budowlanych=" + flaga_kurs_maszyn_budowlanych +
				", flaga_dodatkowe_ubezpieczenie=" + flaga_dodatkowe_ubezpieczenie +
				'}';
	}
}
