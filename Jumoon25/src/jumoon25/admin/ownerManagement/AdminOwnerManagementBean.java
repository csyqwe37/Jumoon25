package jumoon25.admin.ownerManagement;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jumoon25.admin.notice.ListDTO;
import jumoon25.admin.notice.NoticeDTO;
import jumoon25.admin.notice.pagingAction;

import jumoon25.owner.login.OwnerDataBean;

@Controller
@RequestMapping("/admin_ownerManagement/*")
public class AdminOwnerManagementBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap = null;
	
	@RequestMapping("permissionList.do")
	public String permissionList(Model model, int currentPage) {
		
		ListDTO ldto =  new ListDTO();
		
		//모든 글을 가져와 list에 넣는다.
		ldto.setList(sqlMap.queryForList("owner.notPermission"));
		
		ldto.setTotalCount(ldto.getList().size());	//전체 글 갯수를 구한다.
		ldto.setPage(new pagingAction(currentPage, ldto.getTotalCount(), ldto.getBlockCount(), ldto.getBlockPage()));		//pagingAction 객체 생성
		ldto.setPagingHtml(ldto.getPage().getPagingHtml().toString()); 	//페이지 HTML 생성.
		
		//현재 페이지에서 보여줄 마지막 글의 번호 설정
		int lastCount = ldto.getTotalCount();
		
		//현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 lastCount를 +1 번호로 설정.
		if(ldto.getPage().getEndCount() < ldto.getTotalCount())
			lastCount = ldto.getPage().getEndCount() + 1;
		
		//전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		ldto.setList(ldto.getList().subList(ldto.getPage().getStartCount(), lastCount));
		
		model.addAttribute("list",ldto.getList());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagingHtml", ldto.getPagingHtml());
		
		return "/admin_ownerManagement/permissionList";
	}
	
	@RequestMapping("permissionView.do")
	public String perrmissionView(OwnerDataBean dto, Model model, int currentPage) {
		
		System.out.println("현재 열람하고 있는 사장님의 ID는 " + dto.getOwner_id() + "이며 이름은 " + dto.getOwner_name() + "입니다.");
		
		//해당 번호의 글을 가져온다.
		OwnerDataBean resultClass = new OwnerDataBean();
		resultClass = (OwnerDataBean)sqlMap.queryForObject("owner.selectOne", dto.getOwner_id());
		
		model.addAttribute("resultClass", resultClass);
		model.addAttribute("currentPage", currentPage);
		
		return "/admin_ownerManagement/permissionView";
	}
}

