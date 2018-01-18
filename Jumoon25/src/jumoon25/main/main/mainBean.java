package jumoon25.main.main;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainBean {
	@RequestMapping("main/main.do")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping("main/shopTab.do")
	public String shopTab() {
		return "main/shopTab";
	}
}
