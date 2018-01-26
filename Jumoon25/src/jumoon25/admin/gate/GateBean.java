package jumoon25.admin.gate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin_gate/*")
public class GateBean {
	@RequestMapping("main.do")
	public String main() {
		return "/admin_gate/main";
	}
}
