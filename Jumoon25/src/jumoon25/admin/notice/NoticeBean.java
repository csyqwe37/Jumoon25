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
	
	//list부분
	private List<NoticeDTO> list = new ArrayList<NoticeDTO>();
			
	private	int currentPage = 1; 	//현재 페이지
	private	int totalCount;		 	//총 게시물의 수
	private	int blockCount = 10;	//한 페이지의 게시물 수
	private	int blockPage = 5;		//한 화면에 보여줄 페이지 수
	private	String pagingHtml;		//페이징을 구현한 HTML
	private	pagingAction page;		//페이징 클래스
			
	
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

	//write부분
	private NoticeDTO paramClass;															//파라미터를 저장할 객체
	private NoticeDTO resultClass;															//쿼리 결과 값을 저장할 객체
															
	private int no;
	private String subject;
	private String name;
	private String password;
	private String content;
	private String file_orgName;															//업로드 파일의 원래 이름
	private String file_savName;															//서버에 저장할 업로드 파일의 이름. 고유 번호로 구한다
	Calendar today = Calendar.getInstance();												//오늘 날짜 구하기.
	
	private File upload = null;																//파일 객체
	private String uploadFileName, uploadContentType;										//파일 이름, 컨텐츠 타입,
	private String fileUploadPath = "C:\\Users\\jonghwaYang\\eclipse-workspace\\save\\";	//업로드 경로
	
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

	//관리자페이지 메인부분
	@RequestMapping("main.do")
	public String main() {
		return "/admin_notice/main";
	}
	
	//게시판 List
	@RequestMapping("noticeList.do")
	public String list(Model model, int currentPage) {
		//모든 글을 가져와 list에 넣는다.
		list = sqlMap.queryForList("board.selectAll");
		
		totalCount = list.size();		//전체 글 갯수를 구한다.
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);		//pagingAction 객체 생성
		pagingHtml = page.getPagingHtml().toString();		//페이지 HTML 생성.
		
		//현재 페이지에서 보여줄 마지막 글의 번호 설정
		int lastCount = totalCount;
		
		//현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 lastCount를 +1 번호로 설정.
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		//전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
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
	
	//write하기위한 noticeWrite폼으로 이동
	@RequestMapping("noticeWrite.do")
	public String write() {
		return "/admin_notice/noticeWrite";
	}
	
	//write한 데이터를 db에 저장하고 목록으로 돌아옴
	@RequestMapping("noticeWrite2.do")
	public String write2(Model model) throws IOException {
		//파라미터와 리절트 객체 생성
		paramClass = new NoticeDTO();
		resultClass = new NoticeDTO();
		
		//등록할 항목 설정
		paramClass.setSubject(getSubject());
		paramClass.setName(getName());
		paramClass.setPassword(getPassword());
		paramClass.setContent(getContent());
		paramClass.setRegdate(today.getTime());
		
		//등록 쿼리 수행.
		sqlMap.insert("board.insertBoard", paramClass);
		
		//첨부파일을 선택했다면 파일을 업로드
		if(getUpload() != null) {
			//등록한 글 번호 가져오기
			resultClass = (NoticeDTO)sqlMap.queryForObject("board.selectLastNo2");
			
			//실제 서버에 저장될 파일 이름과 확장자 설정
			String file_name = "file_" + no;
			String file_ext = uploadFileName.substring(uploadFileName.lastIndexOf('.')+1, uploadFileName.length());
			
			//서버에 파일 저장
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(upload, destFile);
			
			//파일 정보 파라미터 설정
			paramClass.setNo(resultClass.getNo());
			paramClass.setFile_orgname(getUploadFileName());			//원래 파일 이름
			paramClass.setFile_savname(file_name + "." + file_ext);		//서버에 저장한 파일 이름
			
			model.addAttribute("paramClass", paramClass);
			model.addAttribute("resultClass", resultClass);
			//파일 정보 업데이트
			sqlMap.update("board.updateFile", paramClass);
			
			
		}
		return "/admin_notice/noticeSave";
	}

}
