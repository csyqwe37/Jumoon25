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
		
		//��� ���� ������ list�� �ִ´�.
		ldto.setList(sqlMap.queryForList("owner.notPermission"));
		
		ldto.setTotalCount(ldto.getList().size());	//��ü �� ������ ���Ѵ�.
		ldto.setPage(new pagingAction(currentPage, ldto.getTotalCount(), ldto.getBlockCount(), ldto.getBlockPage()));		//pagingAction ��ü ����
		ldto.setPagingHtml(ldto.getPage().getPagingHtml().toString()); 	//������ HTML ����.
		
		//���� ���������� ������ ������ ���� ��ȣ ����
		int lastCount = ldto.getTotalCount();
		
		//���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ lastCount�� +1 ��ȣ�� ����.
		if(ldto.getPage().getEndCount() < ldto.getTotalCount())
			lastCount = ldto.getPage().getEndCount() + 1;
		
		//��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		ldto.setList(ldto.getList().subList(ldto.getPage().getStartCount(), lastCount));
		
		model.addAttribute("list",ldto.getList());
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagingHtml", ldto.getPagingHtml());
		
		return "/admin_ownerManagement/permissionList";
	}
	
	@RequestMapping("permissionView.do")
	public String perrmissionView(OwnerDataBean dto, Model model, int currentPage) {
		
		System.out.println("���� �����ϰ� �ִ� ������� ID�� " + dto.getOwner_id() + "�̸� �̸��� " + dto.getOwner_name() + "�Դϴ�.");
		
		//�ش� ��ȣ�� ���� �����´�.
		OwnerDataBean resultClass = new OwnerDataBean();
		resultClass = (OwnerDataBean)sqlMap.queryForObject("owner.selectOne", dto.getOwner_id());
		
		model.addAttribute("resultClass", resultClass);
		model.addAttribute("currentPage", currentPage);
		
		return "/admin_ownerManagement/permissionView";
	}
}

