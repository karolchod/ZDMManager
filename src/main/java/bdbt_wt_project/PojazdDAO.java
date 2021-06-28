package bdbt_wt_project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

@Repository
public class PojazdDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public PojazdDAO(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<Pojazd> list() {

		String sql = "SELECT * FROM Pojazdy";

		List<Pojazd> listPojazd = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Pojazd.class));

		return listPojazd;
	}

	// insert

	public void save(Pojazd pojazd) {
		SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
		insertActor.withTableName("pojazdy").usingColumns("marka","rok_produkcji","nr_rejestracyjny","rodzaj_pojazdu","nr_zarzadu");

		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(pojazd);
		insertActor.execute(param);
	}

	// Read

	public Pojazd get(int nr_pojazdu) {
		Object[] args = {nr_pojazdu};
		String sql = "SELECT * FROM POJAZDY WHERE nr_pojazdu = "+args[0];
		Pojazd pojazd = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Pojazd.class));
		return pojazd;
	}

	// Update

	public void update(Pojazd pojazd) {
		String sql = "UPDATE POJAZDY SET marka=:marka, rok_produkcji=:rok_produkcji, nr_rejestracyjny=:nr_rejestracyjny, rodzaj_pojazdu=:rodzaj_pojazdu WHERE nr_pojazdu=:nr_pojazdu";
		BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(pojazd);
		NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);
		template.update(sql, param);
	}

	// Delete

	public void delete(int nr_pojazdu) {
		String sql = "DELETE FROM POJAZDY WHERE nr_pojazdu = ?";
		jdbcTemplate.update(sql,nr_pojazdu);
	}

}
