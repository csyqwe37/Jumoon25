package jumoon25.admin.notice;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import sun.util.resources.cldr.aa.CalendarData_aa_ER;

@Controller
@RequestMapping("/admin_notice/*")
public class NoticeBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap = null;
	
	private String fileUploadPath = "C://Users//jonghwaYang//eclipse-workspace//save//";
	
	//�Խ��� List
	@RequestMapping("noticeList.do")
	public String list(Model model, int currentPage) {
		
		ListDTO ldto =  new ListDTO();
		
		//��� ���� ������ list�� �ִ´�.
		ldto.setList(sqlMap.queryForList("notice.selectAll"));
		
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
	
		return "/admin_notice/noticeList";
	}
	
	//write�ϱ����� noticeWrite������ �̵�
	@RequestMapping("noticeWrite.do")
	public String write() {
	
		return "/admin_notice/noticeWrite";
	}
	
	//write�� �����͸� db�� �����ϰ� ������� ���ƿ�
	@RequestMapping(value="noticeWrite2.do", method=RequestMethod.POST)
	public String write2(NoticeDTO resultClass, MultipartHttpServletRequest multi) throws IOException {
		
		//��� ���� ����.
		sqlMap.insert("notice.insertNotice", resultClass);
		
		MultipartFile mf = multi.getFile("upload");		//���ε� ���� ���� ����
		System.out.println(mf);
		
		//÷�������� �����ߴٸ� ������ ���ε�
		if(!mf.isEmpty()) {
			
			//����� �� ��ȣ ��������
			int max = (int)sqlMap.queryForObject("notice.selectLastNo2");
			
			String savName = "file_" + max;
			
			String orgName = mf.getOriginalFilename();		//���� ���ϸ�
			
			String ext = orgName.substring(orgName.lastIndexOf("."));		//���� Ȯ����
			
			//������ ���� ����
			savName += ext;
			File copy = new File("C://Users//jonghwaYang//eclipse-workspace//save//" + savName);
			mf.transferTo(copy);//���� ����

			//���� ���� �Ķ���� ����
			NoticeDTO paramClass = new NoticeDTO();
			paramClass.setNotice_number(max);
			paramClass.setNotice_fileorg(orgName);
			paramClass.setNotice_filesav(savName);		//������ ������ ���� �̸�
			
			//���� ���� ������Ʈ
			sqlMap.update("notice.updateFile", paramClass);
			
		}
		return "/admin_notice/noticeWritePro";
	}
	
	@RequestMapping("noticeView.do")
	public String view(NoticeDTO dto, Model model, int currentPage) {
		
		System.out.println("���� �����ϰ� ��� ������ ��ȣ�� " + dto.getNotice_number() + "�Դϴ�.");
		
		//�ش� ���� ��ȸ�� +1
		NoticeDTO paramClass = new NoticeDTO();
		paramClass.setNotice_number(dto.getNotice_number());
		sqlMap.update("notice.updateReadCount", paramClass);
		
		//�ش� ��ȣ�� ���� �����´�.
		NoticeDTO resultClass = new NoticeDTO();
		resultClass = (NoticeDTO)sqlMap.queryForObject("notice.selectOne", dto.getNotice_number());
		
		model.addAttribute("resultClass", resultClass);
		model.addAttribute("currentPage", currentPage);
		
		return "/admin_notice/noticeView";
	}
	
	@RequestMapping("fileDownload.do")
	public ModelAndView download(String name) throws Exception {
		
		System.out.println(name);
		//���� ��ο� ���ϸ��� file ��ü�� �ִ´�.
		File fileInfo = new File(fileUploadPath + name);
		ModelAndView mv = new ModelAndView("download", "downloadFile", fileInfo);
		
		
		return mv;
	}
	
	@RequestMapping("noticeModifyBefore.do")
	public String modifyBefore(NoticeDTO dto, Model model) {
		System.out.println(dto.getNotice_number());
		
		NoticeDTO resultClass = new NoticeDTO();
		
		//���� �����͸� �ҷ��´�.
		resultClass = (NoticeDTO)sqlMap.queryForObject("notice.selectOne", dto.getNotice_number());
		
		model.addAttribute("resultClass", resultClass);
		
		return "/admin_notice/noticeWrite";
	}
	                 
	@RequestMapping("noticeModifyAfter.do")
	public String modifyAfter(NoticeDTO resultClass, MultipartHttpServletRequest multi) throws Exception{
		System.out.println("==========");
		//���� ���
		String fileUploadPath = "C://Users//jonghwaYang//eclipse-workspace//save//";
		
		//����� �׸� ����
		sqlMap.update("notice.updateNotice", resultClass);
		
		MultipartFile mf = multi.getFile("upload");		//���ο� ���ε� ���� ���� ����
		
		//������ ������ ���ε� �Ǿ��ٸ� ������ ���ε��ϰ� DB�� file �׸��� ������.
		if(!mf.isEmpty()) {
			
			//���� ������ ����� ���� �̸��� Ȯ���� ����.
			String savName = "file_" + resultClass.getNotice_number();
			String orgName = mf.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));		//���� Ȯ����
			savName += ext;
			
			System.out.println("�������ϸ� : " + orgName);
			System.out.println("�纻���ϸ� : " + savName);
			
			//���� ���� ����
			File deleteFile = new File(fileUploadPath + resultClass.getNotice_filesav());
			System.out.println("������ ����URL : " + fileUploadPath + resultClass.getNotice_filesav());
			deleteFile.delete();
			
			//�� ���� ���ε�
			File copy = new File("C://Users//jonghwaYang//eclipse-workspace//save//" + savName);	//�纻����
			mf.transferTo(copy);		//���Ϻ���
			
			//���� ���� �Ķ���� ����
			resultClass.setNotice_fileorg(orgName);
			resultClass.setNotice_filesav(savName);
			
			//���� ���� ������Ʈ
			sqlMap.update("notice.updateFile", resultClass);	
			
		}			
		return "/admin_notice/noticeModify";
	}
	
	
	@RequestMapping("noticeDelete.do")
	public String delete(NoticeDTO resultClass) {
		
		System.out.println("=========="+resultClass.getNotice_number());
		
		//�ش� ��ȣ�� ���� �����´�.
		NoticeDTO paramClass = new NoticeDTO();
		paramClass = (NoticeDTO) sqlMap.queryForObject("notice.selectOne", resultClass.getNotice_number());
		
		//���� ���� ����
		File deleteFile = new File(fileUploadPath + paramClass.getNotice_filesav());
		deleteFile.delete();
		
		//������ �׸� ����
		paramClass.setNotice_number(resultClass.getNotice_number());
		
		//���� ���� ����.
		sqlMap.update("notice.deleteNotice", paramClass);
		
		return "/admin_notice/noticeDelete";
	}

}
