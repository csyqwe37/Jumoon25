package jumoon25.admin.ownerManagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin_ownerManagement/*")
public class AdminOwnerManagementBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap = null;
	
	@RequestMapping("ownerList.do")
	public String aolist() {
		return "/admin_ownerManagement/ownerList";
	}
}

