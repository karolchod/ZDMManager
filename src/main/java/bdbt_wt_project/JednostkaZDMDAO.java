package bdbt_wt_project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JednostkaZDMDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JednostkaZDMDAO(JdbcTemplate jdbcTemplate) {
		super();
		this.jdbcTemplate = jdbcTemplate;
	}

	public List<JednostkaZDM> list() {

		String sql = "SELECT * FROM Oddzialy_zarzad_drog_miejskich";

		List<JednostkaZDM> listJednostkaZDM = jdbcTemplate.query(sql,
				BeanPropertyRowMapper.newInstance(JednostkaZDM.class));

		return listJednostkaZDM;
	}

	// insert

	public void save(JednostkaZDM jednostkaZDM) {

	}

	// Read

	public JednostkaZDM get(int nr_zarzadu) {
		return null;
	}

	// Update

	public void update(JednostkaZDM jednostkaZDM) {

	}

	// Delete

	public void delete(int nr_zarzadu) {

	}
}
