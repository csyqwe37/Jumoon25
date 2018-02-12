package jumoon25.admin.revenueManagement;


import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jumoon25.client.bean.ClientDTO;

@Controller
@RequestMapping("/admin_revenueManagement/*")
public class AdminRevenueManagementBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap = null;
	
	@RequestMapping("revenueMain.do")
	public String revenueMain() {
		
		return "/admin_revenueManagement/revenueMain";
	}
	
	@RequestMapping("api.do")
	public String api() {
		
		return "/admin_revenueManagement/api";
	}
	
	@RequestMapping("kakao.do")
	public String kakao() {
		
		return "/admin_revenueManagement/kakao";
	}
	
	@RequestMapping("result.do")
	public String result(HttpServletResponse response, HttpServletRequest request, HttpSession session, Model model) {
		ClientDTO dto = new ClientDTO();
		String idNum = request.getParameter("idNum");
		String nick = "";
		String img = "#";
		String url = "";
		
		int search = (int)(sqlMap.queryForObject("client.searchClientId", idNum));
		System.out.println("search : " + search);
		
		if(idNum != null){
			if(search == 0) {	//ó�� �α����ϴ� �����̸� �߰� �Է����� ������ ��
				System.out.println("ó�� �α���");
				dto.setClient_id(request.getParameter("idNum"));
				dto.setClient_name(request.getParameter("nickName"));
				dto.setClient_image(request.getParameter("profile_img"));
				
				model.addAttribute("dto", dto);
				session.setAttribute("LOGININFO", dto);
				
				url = "result";
			}
			else {	//�̹� �湮�� ���� �ִٸ� client DB�� ����������Ƿ� �߰� ������ ���� �ʿ䰡 ���� ������ Ȩ���� ���ư���.
				System.out.println("���� ȸ��");
				dto.setClient_id(request.getParameter("idNum"));
				dto.setClient_name(request.getParameter("nickName"));
				dto.setClient_image(request.getParameter("profile_img"));
				
				session.setAttribute("LOGININFO", dto);
				
				url = "revenueMain";
			}
		}
		return "/admin_revenueManagement/" + url;
	}
	/*
	@RequestMapping("result.do")
	public String result(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception{
		String url = null;
		String id = request.getParameter("id");
		
		if(sqlMap.queryForObject("client.searchClientId", id) == null) {
			ClientDTO dto = new ClientDTO();
			dto.setClient_id(request.getParameter("id"));
			dto.setClient_name(URLDecoder.decode(request.getParameter("nickname"),"UTF-8"));
			dto.setClient_image(request.getParameter("image"));
			
			model.addAttribute("dto", dto);
			
			url = "result";
		}
		else {
			url = "revenueMain";
		}
		return "/admin_revenueManagement/" + url;
	}
	*/
	@RequestMapping("clientInfo.do")
	public String clientInfo(HttpServletResponse response, HttpServletRequest request, ClientDTO dto) throws Exception{
		String client_sex = request.getParameter("client_sex");
		dto.setClient_sex(client_sex);
		
		//��� ���� ����
		sqlMap.insert("client.insertClient", dto);
		
		
		return "/admin_revenueManagement/revenueMain";
	}
	
	@RequestMapping("kakaoLogout.do")
	public String logout(){
		return "/admin_revenueManagement/kakaoLogout";
	}
	
}
