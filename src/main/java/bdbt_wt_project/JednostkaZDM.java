package bdbt_wt_project;

public class JednostkaZDM {

	private int nr_zarzadu;
	private String nazwa;
	private String adres;
	private String data_zalozenia;
	private String adres_strony_www;
	private String nr_adresu;

	public JednostkaZDM() {

	}

	public JednostkaZDM(int nr_zarzadu, String nazwa, String adres, String data_zalozenia, String adres_strony_www, String nr_adresu) {
		super();
		this.nr_zarzadu = nr_zarzadu;
		this.nazwa = nazwa;
		this.adres = adres;
		this.data_zalozenia = data_zalozenia;
		this.adres_strony_www = adres_strony_www;
		this.nr_adresu = nr_adresu;
	}

	
	// getters and setters
	
	public int getNr_zarzadu() {
		return nr_zarzadu;
	}

	public void setNr_zarzadu(int nr_zarzadu) {
		this.nr_zarzadu = nr_zarzadu;
	}

	public String getNazwa() {
		return nazwa;
	}

	public void setNazwa(String nazwa) {
		this.nazwa = nazwa;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getData_zalozenia() {
		return data_zalozenia;
	}

	public void setData_zalozenia(String data_zalozenia) {
		this.data_zalozenia = data_zalozenia;
	}

	public String getAdres_strony_www() {
		return adres_strony_www;
	}

	public void setAdres_strony_www(String adres_strony_www) {
		this.adres_strony_www = adres_strony_www;
	}

	public String getNr_adresu() {
		return nr_adresu;
	}

	public void setNr_adresu(String nr_adresu) {
		this.nr_adresu = nr_adresu;
	}

	@Override
	public String toString() {
		return "JednostkaZDM [nr_zarzadu=" + nr_zarzadu + ", nazwa=" + nazwa + ", adres=" + adres + ", data_zalozenia="
				+ data_zalozenia + ", adres_strony_www=" + adres_strony_www + ", nr_adresu=" + nr_adresu + "]";
	}
	

	
}
