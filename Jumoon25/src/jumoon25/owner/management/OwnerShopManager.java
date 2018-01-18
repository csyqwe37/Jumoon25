package jumoon25.owner.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OwnerShopManager {
	@Autowired
	private SqlMapClientTemplate sqlMap = null;
	
	@RequestMapping("/owner_management/owner_main.do")
	public String owner_main() {
		return "/owner_management/owner_main";
	}
	
	@RequestMapping("/owner_management/owner_shop_management.do")
	public String owner_shop_management() {
		return "/owner_management/owner_shop_management";
	}
	
	@RequestMapping("/owner_management/owner_addShopForm.do")
	public String owner_addShopForm() {
		return "/owner_management/owner_addShopForm";
	}
	
	@RequestMapping("/owner_management/owner_addShopPro.do")
	public String owner_addShopPro() {
		return "/owner_management/owner_addShopPro";
	}

}
