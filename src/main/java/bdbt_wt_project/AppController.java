package bdbt_wt_project;

import java.sql.Date;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppController {

	@Autowired
	private JednostkaZDMDAO daoJednostka;
	@Autowired
	private PojazdDAO daoPojazd;
	@Autowired
	private PracownikDAO daoPracownik;
	@Autowired
	private WyjazdDAO daoWyjazd;
	
	@RequestMapping("/")
	public String viewHomePage(Model model) {
		List<JednostkaZDM> listJednostkaZDM = daoJednostka.list();
		model.addAttribute("listJednostkaZDM", listJednostkaZDM);
		return "index";
	}

	@RequestMapping("/style.css")
	public String viewStyleCSS(Model model) {
		return "style.css";
	}

	@RequestMapping("/pojazdy")
	public String viewPojazdy(Model model) {
		 List<Pojazd> listPojazd = daoPojazd.list();
		 model.addAttribute("listPojazd", listPojazd);
		 return "pojazdy";
	}

	@RequestMapping("/newPojazd")
	public String showNewFormPojazd(Model model) {

		List<JednostkaZDM> listJednostkaZDM = daoJednostka.list();
		model.addAttribute("listJednostkaZDM", listJednostkaZDM);
		Pojazd pojazd = new Pojazd();
		model.addAttribute("pojazd", pojazd);
		return "newPojazd";
	}

	@RequestMapping(value = "/savePojazd", method = RequestMethod.POST)
	public String savePojazd(@ModelAttribute("pojazd") Pojazd pojazd) {
		try{
			daoPojazd.save(pojazd);
			return "redirect:/pojazdy";
		}catch (Exception ex){
			return "redirect:/error";
		}
	}

	@RequestMapping(value = "/editPojazd/{nr_pojazdu}")
	public ModelAndView showEditFormPojazd(@PathVariable(name = "nr_pojazdu") int nr_pojazdu) {
		ModelAndView mav = new ModelAndView("editPojazd");
		Pojazd pojazd = daoPojazd.get(nr_pojazdu);
		mav.addObject("pojazd",pojazd);
		return mav;
	}

	@RequestMapping(value = "/updatePojazd", method = RequestMethod.POST)
	public String updatePojazd(@ModelAttribute("pojazd") Pojazd pojazd) {
		try{
			daoPojazd.update(pojazd);
			return "redirect:/pojazdy";
		}catch (Exception ex){
			return "redirect:/error";
		}
	}
	@RequestMapping(value = "/deletePojazd/{nr_pojazdu}")
	public String deletePojazd(@PathVariable(name = "nr_pojazdu") int nr_pojazdu) {
		daoPojazd.delete(nr_pojazdu);
		return "redirect:/pojazdy";
	}

	@RequestMapping("/pracownik")
	public String viewPracownicy(Model model) {
		List<Pracownik> listPracownik = daoPracownik.list();
		model.addAttribute("listPracownik", listPracownik);
		return "pracownik";
	}

	@RequestMapping("/wyjazd")
	public String viewWyjazd(Model model) {
		List<Wyjazd> listWyjazd = daoWyjazd.list();
		model.addAttribute("listWyjazd", listWyjazd);
		return "wyjazd";
	}

	@RequestMapping("/newWyjazd")
	public String showNewFormWyjazd(Model model) {

		List<Pracownik> listPracownik = daoPracownik.list();
		model.addAttribute("listPracownik", listPracownik);
		List<Pojazd> listPojazd = daoPojazd.list();
		model.addAttribute("listPojazd", listPojazd);
		Wyjazd wyjazd = new Wyjazd();
		wyjazd.setData_obslugi( new java.sql.Date(System.currentTimeMillis()));
		model.addAttribute("wyjazd", wyjazd);
		return "newWyjazd";
	}

	@RequestMapping(value = "/saveWyjazd", method = RequestMethod.POST)
	public String saveWyjazd(@ModelAttribute("wyjazd") Wyjazd wyjazd) {
		try{
			daoWyjazd.save(wyjazd);
			return "redirect:/wyjazd";
		}catch (Exception ex){
			return "redirect:/error";
		}
	}

	@RequestMapping(value = "/deleteWyjazd/{data_obslugi}/{nr_pojazdu}/{nr_pracownika}")
	public String deleteWyjazd(@PathVariable(name = "data_obslugi") String data_obslugi, @PathVariable(name = "nr_pojazdu") int nr_pojazdu, @PathVariable(name = "nr_pracownika") int nr_pracownika) {
		daoWyjazd.delete(Date.valueOf(data_obslugi),nr_pojazdu, nr_pracownika);
		return "redirect:/wyjazd";
	}


}
