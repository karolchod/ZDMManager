package bdbt_wt_project;

public class Pojazd {

	private int nr_pojazdu;
	private String marka;
	private String rok_produkcji;
	private String nr_rejestracyjny;
	private String rodzaj_pojazdu;
	private String nr_zarzadu;

	public Pojazd() {

	}

	public Pojazd(int nr_pojazdu, String marka, String rok_produkcji, String nr_rejestracyjny, String rodzaj_pojazdu, String nr_zarzadu) {
		super();
		this.nr_pojazdu = nr_pojazdu;
		this.marka = marka;
		this.rok_produkcji = rok_produkcji;
		this.nr_rejestracyjny = nr_rejestracyjny;
		this.rodzaj_pojazdu = rodzaj_pojazdu;
		this.nr_zarzadu = nr_zarzadu;

	}

	public int getNr_pojazdu() {
		return nr_pojazdu;
	}

	public void setNr_pojazdu(int nr_pojazdu) {
		this.nr_pojazdu = nr_pojazdu;
	}

	public String getMarka() {
		return marka;
	}

	public void setMarka(String marka) {
		this.marka = marka;
	}

	public String getRok_produkcji() {
		return rok_produkcji;
	}

	public void setRok_produkcji(String rok_produkcji) {
		this.rok_produkcji = rok_produkcji;
	}

	public String getNr_rejestracyjny() {
		return nr_rejestracyjny;
	}

	public void setNr_rejestracyjny(String nr_rejestracyjny) {
		this.nr_rejestracyjny = nr_rejestracyjny;
	}

	public String getRodzaj_pojazdu() {
		return rodzaj_pojazdu;
	}

	public void setRodzaj_pojazdu(String rodzaj_pojazdu) {
		this.rodzaj_pojazdu = rodzaj_pojazdu;
	}

	public String getNr_zarzadu() {
		return nr_zarzadu;
	}

	public void setNr_zarzadu(String nr_zarzadu) {
		this.nr_zarzadu = nr_zarzadu;
	}

	@Override
	public String toString() {
		return "Pojazd [nr_pojazdu=" + nr_pojazdu + ", marka=" + marka + ", rok_produkcji=" + rok_produkcji
				+ ", nr_rejestracyjny=" + nr_rejestracyjny + ", rodzaj_pojazdu=" + rodzaj_pojazdu + ", nr_zarzadu=" + nr_zarzadu + "]";
	}

}
