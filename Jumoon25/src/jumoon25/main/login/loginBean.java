package jumoon25.main.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class loginBean {

	
	@RequestMapping("main/naverLogin.do")
	public String naverLogin() {
		return "main/naverLogin";
	}
	
	@RequestMapping("main/inputForm.do")
	public String inputForm() {
		return "main/newId/inputForm";
	}
	
	@RequestMapping("main/kakaoLogin")
	public String kakaoLogin() {
		return "main/kakaoLogin";
	}
	
	@RequestMapping("main/kakaoLoginPro")
	public String kakaoLoginPro() {
		return "main/kakaoLoginPro";
	}
	
}
