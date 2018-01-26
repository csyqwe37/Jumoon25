package jumoon25.admin.notice;

import java.io.File;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {
	private int notice_number;
	private String notice_title;
	private String notice_content;
	private String notice_fileorg;
	private String notice_filesav;
	private int notice_readcount;
	private Date notice_time;
	
	public int getNotice_number() {
		return notice_number;
	}
	public void setNotice_number(int notice_number) {
		this.notice_number = notice_number;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_fileorg() {
		return notice_fileorg;
	}
	public void setNotice_fileorg(String notice_fileorg) {
		this.notice_fileorg = notice_fileorg;
	}
	public String getNotice_filesav() {
		return notice_filesav;
	}
	public void setNotice_filesav(String notice_filesav) {
		this.notice_filesav = notice_filesav;
	}
	public int getNotice_readcount() {
		return notice_readcount;
	}
	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}
	public Date getNotice_time() {
		return notice_time;
	}
	public void setNotice_time(Date notice_time) {
		this.notice_time = notice_time;
	}

	
	
	
}
