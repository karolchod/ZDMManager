package bdbt_wt_project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PracownikDAO {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public PracownikDAO(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Pracownik> list() {

		String sql = "SELECT pracownicy_fizyczni.nr_pracownika, pracownicy.nazwisko, pracownicy.imie, pracownicy.nr_telefonu, pracownicy_fizyczni.flaga_kurs_maszyn_budowlanych, pracownicy_fizyczni.flaga_dodatkowe_ubezpieczenie "+
				"FROM pracownicy_fizyczni " +
				"JOIN pracownicy ON pracownicy.nr_pracownika = pracownicy_fizyczni.nr_pracownika";

		List<Pracownik> listPracownik = jdbcTemplate.query(sql,
				BeanPropertyRowMapper.newInstance(Pracownik.class));

		return listPracownik;
	}

	// insert

	public void save(Pracownik pracownik) {

	}

	// Read

	public Pracownik get(int nr_pracownika) {
		return null;
	}

	// Update

	public void update(Pracownik pracownik) {

	}

	// Delete

	public void delete(int nr_pracownika) {

	}
}
