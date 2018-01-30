package jumoon25.admin.gate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin_gate/*")
public class GateBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap = null;
	
	@RequestMapping("main.do")
	public String main() {
		return "/admin_gate/main";
	}
}
