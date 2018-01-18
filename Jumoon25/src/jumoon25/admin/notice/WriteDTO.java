package jumoon25.admin.notice;

import java.io.File;
import java.util.Calendar;

public class WriteDTO {
	//write부분
		NoticeDTO paramClass;															//파라미터를 저장할 객체
		NoticeDTO resultClass;															//쿼리 결과 값을 저장할 객체
																
		int no;
		String subject;
		String name;
		String password;
		String content;
		String file_orgName;															//업로드 파일의 원래 이름
		String file_savName;															//서버에 저장할 업로드 파일의 이름. 고유 번호로 구한다
		Calendar today = Calendar.getInstance();												//오늘 날짜 구하기.
		
		File upload = null;																//파일 객체
		String uploadFileName, uploadContentType;										//파일 이름, 컨텐츠 타입,
		String fileUploadPath = "C:\\Users\\jonghwaYang\\eclipse-workspace\\save\\";	//업로드 경로
		
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
}
