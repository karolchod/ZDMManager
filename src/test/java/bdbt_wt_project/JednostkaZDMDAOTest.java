package bdbt_wt_project;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

class JednostkaZDMDAOTest {

	private JednostkaZDMDAO dao;

	@BeforeEach
	void setUp() throws Exception {

		DriverManagerDataSource datasource = new DriverManagerDataSource();

		datasource.setUrl("jdbc:oracle:thin:@localhost:1521:ORCL1");
		datasource.setUsername("ZARZADDROG");
		datasource.setPassword("qwerty");
		datasource.setDriverClassName("oracle.jdbc.OracleDriver");

		// import JdbcTemplate
		dao = new JednostkaZDMDAO(new JdbcTemplate(datasource));
	}

	@Test
	void testList() {
		List<JednostkaZDM> listJednostkaZDM = dao.list();
		assertFalse(listJednostkaZDM.isEmpty());
	}

	@Test
	void testSave() {
		fail("Not yet implemented");
	}

	@Test
	void testGet() {
		fail("Not yet implemented");
	}

	@Test
	void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	void testDelete() {
		fail("Not yet implemented");
	}

}
