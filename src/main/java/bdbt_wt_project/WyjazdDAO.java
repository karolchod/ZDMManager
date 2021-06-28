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
public class WyjazdDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public WyjazdDAO(JdbcTemplate jdbcTemplate) {
        super();
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Wyjazd> list() {

        String sql = "SELECT pracownicy_fizyczni_pojazdy.data_obslugi, pracownicy.nr_pracownika, pracownicy.nazwisko, pracownicy.imie, pojazdy.nr_pojazdu, pojazdy.nr_rejestracyjny, pojazdy.marka, pojazdy.rodzaj_pojazdu " +
                "FROM pracownicy_fizyczni_pojazdy " +
                "JOIN pracownicy ON pracownicy.nr_pracownika = pracownicy_fizyczni_pojazdy.nr_pracownika " +
                "JOIN pojazdy ON pojazdy.nr_pojazdu = pracownicy_fizyczni_pojazdy.nr_pojazdu";

        List<Wyjazd> listWyjazd = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Wyjazd.class));

        return listWyjazd;
    }

    // insert

    public void save(Wyjazd wyjazd) {
        SimpleJdbcInsert insertActor = new SimpleJdbcInsert(jdbcTemplate);
        insertActor.withTableName("pracownicy_fizyczni_pojazdy").usingColumns("data_obslugi","nr_pojazdu","nr_pracownika");

        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(wyjazd);
        insertActor.execute(param);
    }

    // Read

    public Pojazd get(int nr_pojazdu) {
//        Object[] args = {nr_pojazdu};
//        String sql = "SELECT * FROM POJAZDY WHERE nr_pojazdu = "+args[0];
//        Pojazd pojazd = jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Pojazd.class));
//        return pojazd;
        return null;
    }

    // Update

    public void update(Pojazd pojazd) {
//        String sql = "UPDATE POJAZDY SET marka=:marka, rok_produkcji=:rok_produkcji, nr_rejestracyjny=:nr_rejestracyjny, rodzaj_pojazdu=:rodzaj_pojazdu WHERE nr_pojazdu=:nr_pojazdu";
//        BeanPropertySqlParameterSource param = new BeanPropertySqlParameterSource(pojazd);
//        NamedParameterJdbcTemplate template = new NamedParameterJdbcTemplate(jdbcTemplate);
//        template.update(sql, param);
    }

    // Delete

    public void delete(java.sql.Date data_obslugi, int nr_pojazdu, int nr_pracownika) {
        String sql = "DELETE FROM pracownicy_fizyczni_pojazdy WHERE data_obslugi = ? AND nr_pojazdu = ? AND nr_pracownika = ?";
        jdbcTemplate.update(sql,data_obslugi,nr_pojazdu,nr_pracownika);
    }

}
