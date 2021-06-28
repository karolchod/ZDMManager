package bdbt_wt_project;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

class PojazdDAOTest {

	private PojazdDAO dao;

	@BeforeEach
	void setUp() throws Exception {

		DriverManagerDataSource datasource = new DriverManagerDataSource();

		datasource.setUrl("jdbc:oracle:thin:@localhost:1521:ORCL1");
		datasource.setUsername("ZARZADDROG");
		datasource.setPassword("qwerty");
		datasource.setDriverClassName("oracle.jdbc.OracleDriver");

		// import JdbcTemplate
		dao = new PojazdDAO(new JdbcTemplate(datasource));
	}

	@Test
	void testList() {
		List<Pojazd> listPojazd = dao.list();
		assertFalse(listPojazd.isEmpty());
	}

	@Test
	void testSave() {
		Pojazd pojazd = new Pojazd(0,"Test","1111","11 1111","Inny","1");
		dao.save(pojazd);
	}

	@Test
	void testGet() {
		int id = 1;
		Pojazd pojazd = dao.get(id);
		assertNotNull(pojazd);
	}

	@Test
	void testUpdate() {
		Pojazd pojazd = new Pojazd(12,"testUp","1999","pp pppp","Koparka", "1");
		dao.update(pojazd);
	}

	@Test
	void testDelete() {
		int id = 12;
		dao.delete(id);
	}

}
