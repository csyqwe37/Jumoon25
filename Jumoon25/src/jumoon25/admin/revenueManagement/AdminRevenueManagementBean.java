package jumoon25.admin.revenueManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin_revenueManagement/*")
public class AdminRevenueManagementBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap = null;
	
	@RequestMapping("revenueMain.do")
	public String revenueMain() {
		
		return "/admin_revenueManagement/revenueMain";
	}
}