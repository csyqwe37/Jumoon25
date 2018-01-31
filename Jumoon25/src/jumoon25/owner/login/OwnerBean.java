package jumoon25.owner.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jumoon25.admin.bean.AdminDataBean;

@Controller
public class OwnerBean {

	@Autowired
	private SqlMapClientTemplate sqlMap = null;
	private AdminDataBean admin_dto = null;

	@RequestMapping("/owner_login/owner_loginForm.do")
	public String owner_loginForm() {
		return "/owner_login/owner_loginForm";
	}

	@RequestMapping("/owner_login/owner_loginPro.do")
	public String owner_loginPro(OwnerDataBean owner_dto, HttpSession session, Model model) {
		String view = "/owner_login/owner_loginPro";
		System.out.println(owner_dto.getOwner_id());
		if (owner_dto.getOwner_id().equals("admin")) {
			admin_dto = new AdminDataBean();
			admin_dto.setAdmin_id(owner_dto.getOwner_id());
			admin_dto.setAdmin_pw(owner_dto.getOwner_pw());
			int check = (Integer) sqlMap.queryForObject("owner.adminLoginCheck", admin_dto);
			if (check == 1) {
				System.out.println("ddddd");
				System.out.println(admin_dto.getAdmin_id());
				session.setAttribute("ownerId", admin_dto.getAdmin_id());
				view = "redirect:/admin_gate/main.do";
			}
		} else {
			int check = (Integer) sqlMap.queryForObject("owner.ownerLoginCheck", owner_dto);
			if (check == 1) {
				session.setAttribute("ownerId", owner_dto.getOwner_id());
				view = "redirect:/owner_management/owner_main.do";
			}
		}
		model.addAttribute("session", session);
		return view;
	}	
	
	@RequestMapping("/owner_login/owner_inputForm.do")
	public String owner_inputForm() {
		return "/owner_login/owner_inputForm";
	}
	
	@RequestMapping("/owner_login/owner_confirmId.do")
	public String owner_confirmId(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		int check = (Integer) sqlMap.queryForObject("owner.ownerIdCheck", id);
		model.addAttribute("check",check);
		model.addAttribute("id", id);
		return "/owner_login/owner_confirmId";
	}
	
	@RequestMapping("/owner_login/owner_inputPro.do")
	public String owner_inputPro(OwnerDataBean owner_dto) {
		sqlMap.insert("owner.ownerInput",owner_dto);
		return "/owner_login/owner_inputPro";
	}
	
	@RequestMapping("/owner_login/owner_logout.do")
	public String owner_logout(HttpSession session) {
		session.invalidate();
		return "/owner_login/owner_logout";
	}
	
}
