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
	
	//게시판 List
	@RequestMapping("noticeList.do")
	public String list(Model model, int currentPage) {
		
		ListDTO ldto =  new ListDTO();
		
		//모든 글을 가져와 list에 넣는다.
		ldto.setList(sqlMap.queryForList("notice.selectAll"));
		
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
	
		return "/admin_notice/noticeList";
	}
	
	//write하기위한 noticeWrite폼으로 이동
	@RequestMapping("noticeWrite.do")
	public String write() {
	
		return "/admin_notice/noticeWrite";
	}
	
	//write한 데이터를 db에 저장하고 목록으로 돌아옴
	@RequestMapping(value="noticeWrite2.do", method=RequestMethod.POST)
	public String write2(NoticeDTO resultClass, MultipartHttpServletRequest multi) throws IOException {
		
		//등록 쿼리 수행.
		sqlMap.insert("notice.insertNotice", resultClass);
		
		MultipartFile mf = multi.getFile("upload");		//업로드 파일 원본 정보
		System.out.println(mf);
		
		//첨부파일을 선택했다면 파일을 업로드
		if(!mf.isEmpty()) {
			
			//등록한 글 번호 가져오기
			int max = (int)sqlMap.queryForObject("notice.selectLastNo2");
			
			String savName = "file_" + max;
			
			String orgName = mf.getOriginalFilename();		//원본 파일명
			
			String ext = orgName.substring(orgName.lastIndexOf("."));		//원본 확장자
			
			//서버에 파일 저장
			savName += ext;
			File copy = new File("C://Users//jonghwaYang//eclipse-workspace//save//" + savName);
			mf.transferTo(copy);//파일 복사

			//파일 정보 파라미터 설정
			NoticeDTO paramClass = new NoticeDTO();
			paramClass.setNotice_number(max);
			paramClass.setNotice_fileorg(orgName);
			paramClass.setNotice_filesav(savName);		//서버에 저장한 파일 이름
			
			//파일 정보 업데이트
			sqlMap.update("notice.updateFile", paramClass);
			
		}
		return "/admin_notice/noticeWritePro";
	}
	
	@RequestMapping("noticeView.do")
	public String view(NoticeDTO dto, Model model, int currentPage) {
		
		System.out.println("현재 열람하고 계신 데이터 번호는 " + dto.getNotice_number() + "입니다.");
		
		//해당 글의 조회수 +1
		NoticeDTO paramClass = new NoticeDTO();
		paramClass.setNotice_number(dto.getNotice_number());
		sqlMap.update("notice.updateReadCount", paramClass);
		
		//해당 번호의 글을 가져온다.
		NoticeDTO resultClass = new NoticeDTO();
		resultClass = (NoticeDTO)sqlMap.queryForObject("notice.selectOne", dto.getNotice_number());
		
		model.addAttribute("resultClass", resultClass);
		model.addAttribute("currentPage", currentPage);
		
		return "/admin_notice/noticeView";
	}
	
	@RequestMapping("fileDownload.do")
	public ModelAndView download(String name) throws Exception {
		
		System.out.println(name);
		//파일 경로와 파일명을 file 객체에 넣는다.
		File fileInfo = new File(fileUploadPath + name);
		ModelAndView mv = new ModelAndView("download", "downloadFile", fileInfo);
		
		
		return mv;
	}
	
	@RequestMapping("noticeModifyBefore.do")
	public String modifyBefore(NoticeDTO dto, Model model) {
		System.out.println(dto.getNotice_number());
		
		NoticeDTO resultClass = new NoticeDTO();
		
		//기존 데이터를 불러온다.
		resultClass = (NoticeDTO)sqlMap.queryForObject("notice.selectOne", dto.getNotice_number());
		
		model.addAttribute("resultClass", resultClass);
		
		return "/admin_notice/noticeWrite";
	}
	                 
	@RequestMapping("noticeModifyAfter.do")
	public String modifyAfter(NoticeDTO resultClass, MultipartHttpServletRequest multi) throws Exception{
		System.out.println("==========");
		//파일 경로
		String fileUploadPath = "C://Users//jonghwaYang//eclipse-workspace//save//";
		
		//변경된 항목 수정
		sqlMap.update("notice.updateNotice", resultClass);
		
		MultipartFile mf = multi.getFile("upload");		//새로운 업로드 파일 원본 정보
		
		//수정할 파일이 업로드 되었다면 파일을 업로드하고 DB의 file 항목을 수정함.
		if(!mf.isEmpty()) {
			
			//실제 서버에 저장될 파일 이름과 확장자 설정.
			String savName = "file_" + resultClass.getNotice_number();
			String orgName = mf.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));		//원본 확장자
			savName += ext;
			
			System.out.println("원본파일명 : " + orgName);
			System.out.println("사본파일명 : " + savName);
			
			//이전 파일 삭제
			File deleteFile = new File(fileUploadPath + resultClass.getNotice_filesav());
			System.out.println("삭제할 파일URL : " + fileUploadPath + resultClass.getNotice_filesav());
			deleteFile.delete();
			
			//새 파일 업로드
			File copy = new File("C://Users//jonghwaYang//eclipse-workspace//save//" + savName);	//사본생성
			mf.transferTo(copy);		//파일복사
			
			//파일 정보 파라미터 설정
			resultClass.setNotice_fileorg(orgName);
			resultClass.setNotice_filesav(savName);
			
			//파일 정보 업데이트
			sqlMap.update("notice.updateFile", resultClass);	
			
		}			
		return "/admin_notice/noticeModify";
	}
	
	
	@RequestMapping("noticeDelete.do")
	public String delete(NoticeDTO resultClass) {
		
		System.out.println("=========="+resultClass.getNotice_number());
		
		//해당 번호의 글을 가져온다.
		NoticeDTO paramClass = new NoticeDTO();
		paramClass = (NoticeDTO) sqlMap.queryForObject("notice.selectOne", resultClass.getNotice_number());
		
		//서버 파일 삭제
		File deleteFile = new File(fileUploadPath + paramClass.getNotice_filesav());
		deleteFile.delete();
		
		//삭제할 항목 설정
		paramClass.setNotice_number(resultClass.getNotice_number());
		
		//삭제 쿼리 수행.
		sqlMap.update("notice.deleteNotice", paramClass);
		
		return "/admin_notice/noticeDelete";
	}

}
