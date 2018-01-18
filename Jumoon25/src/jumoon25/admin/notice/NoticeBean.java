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

@Controller
@RequestMapping("/notice/*")
public class NoticeBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap = null;
	
	//list�κ�
	private List<NoticeDTO> list = new ArrayList<NoticeDTO>();
			
	private	int currentPage = 1; 	//���� ������
	private	int totalCount;		 	//�� �Խù��� ��
	private	int blockCount = 10;	//�� �������� �Խù� ��
	private	int blockPage = 5;		//�� ȭ�鿡 ������ ������ ��
	private	String pagingHtml;		//����¡�� ������ HTML
	private	pagingAction page;		//����¡ Ŭ����
			
	
	public List<NoticeDTO> getList() {
		return list;
	}

	public void setList(List<NoticeDTO> list) {
		this.list = list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public pagingAction getPage() {
		return page;
	}

	public void setPage(pagingAction page) {
		this.page = page;
	}

	//write�κ�
	private NoticeDTO paramClass;															//�Ķ���͸� ������ ��ü
	private NoticeDTO resultClass;															//���� ��� ���� ������ ��ü
															
	private int no;
	private String subject;
	private String name;
	private String password;
	private String content;
	private String file_orgName;															//���ε� ������ ���� �̸�
	private String file_savName;															//������ ������ ���ε� ������ �̸�. ���� ��ȣ�� ���Ѵ�
	Calendar today = Calendar.getInstance();												//���� ��¥ ���ϱ�.
	
	private File upload = null;																//���� ��ü
	private String uploadFileName, uploadContentType;										//���� �̸�, ������ Ÿ��,
	private String fileUploadPath = "C:\\Users\\jonghwaYang\\eclipse-workspace\\save\\";	//���ε� ���
	
	public NoticeDTO getParamClass() {
		return paramClass;
	}

	public void setParamCLass(NoticeDTO paramClass) {
		this.paramClass = paramClass;
	}

	public NoticeDTO getResultClass() {
		return resultClass;
	}

	public void setResultClass(NoticeDTO resultClass) {
		this.resultClass = resultClass;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFile_orgName() {
		return file_orgName;
	}

	public void setFile_orgName(String file_orgName) {
		this.file_orgName = file_orgName;
	}

	public String getFile_savName() {
		return file_savName;
	}

	public void setFile_savName(String file_savName) {
		this.file_savName = file_savName;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	//������������ ���κκ�
	@RequestMapping("main.do")
	public String main() {
		return "/admin_notice/main";
	}
	
	//�Խ��� List
	@RequestMapping("noticeList.do")
	public String list(Model model, int currentPage) {
		//��� ���� ������ list�� �ִ´�.
		list = sqlMap.queryForList("board.selectAll");
		
		totalCount = list.size();		//��ü �� ������ ���Ѵ�.
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);		//pagingAction ��ü ����
		pagingHtml = page.getPagingHtml().toString();		//������ HTML ����.
		
		//���� ���������� ������ ������ ���� ��ȣ ����
		int lastCount = totalCount;
		
		//���� �������� ������ ���� ��ȣ�� ��ü�� ������ �� ��ȣ���� ������ lastCount�� +1 ��ȣ�� ����.
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		//��ü ����Ʈ���� ���� ��������ŭ�� ����Ʈ�� �����´�.
		list = list.subList(page.getStartCount(), lastCount);
		model.addAttribute("list",list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagingHtml", pagingHtml);
		
		System.out.println(page.getTotalPage());
		System.out.println(page.getStartPage());
		System.out.println(page.getEndPage());
		System.out.println("==============");
		System.out.println(page.getCurrentPage());
		System.out.println("==============");
		
		System.out.println(page.getStartCount());
		System.out.println(page.getEndCount());
		System.out.println(page.getTotalCount());
		System.out.println(pagingHtml);
		
		return "/admin_notice/noticeList";
	}
	
	//write�ϱ����� noticeWrite������ �̵�
	@RequestMapping("noticeWrite.do")
	public String write() {
		return "/admin_notice/noticeWrite";
	}
	
	//write�� �����͸� db�� �����ϰ� ������� ���ƿ�
	@RequestMapping("noticeWrite2.do")
	public String write2(Model model) throws IOException {
		//�Ķ���Ϳ� ����Ʈ ��ü ����
		paramClass = new NoticeDTO();
		resultClass = new NoticeDTO();
		
		//����� �׸� ����
		paramClass.setSubject(getSubject());
		paramClass.setName(getName());
		paramClass.setPassword(getPassword());
		paramClass.setContent(getContent());
		paramClass.setRegdate(today.getTime());
		
		//��� ���� ����.
		sqlMap.insert("board.insertBoard", paramClass);
		
		//÷�������� �����ߴٸ� ������ ���ε�
		if(getUpload() != null) {
			//����� �� ��ȣ ��������
			resultClass = (NoticeDTO)sqlMap.queryForObject("board.selectLastNo2");
			
			//���� ������ ����� ���� �̸��� Ȯ���� ����
			String file_name = "file_" + no;
			String file_ext = uploadFileName.substring(uploadFileName.lastIndexOf('.')+1, uploadFileName.length());
			
			//������ ���� ����
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(upload, destFile);
			
			//���� ���� �Ķ���� ����
			paramClass.setNo(resultClass.getNo());
			paramClass.setFile_orgname(getUploadFileName());			//���� ���� �̸�
			paramClass.setFile_savname(file_name + "." + file_ext);		//������ ������ ���� �̸�
			
			model.addAttribute("paramClass", paramClass);
			model.addAttribute("resultClass", resultClass);
			//���� ���� ������Ʈ
			sqlMap.update("board.updateFile", paramClass);
			
			
		}
		return "/admin_notice/noticeSave";
	}

}
