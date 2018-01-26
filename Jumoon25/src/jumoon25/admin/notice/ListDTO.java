package jumoon25.admin.notice;

import java.util.ArrayList;
import java.util.List;

public class ListDTO {
	//list부분
		private List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		private int currentPage = 1; 	//현재 페이지
		private int totalCount;		 	//총 게시물의 수
		private int blockCount = 10;	//한 페이지의 게시물 수
		private int blockPage = 5;		//한 화면에 보여줄 페이지 수
		private String pagingHtml;		//페이징을 구현한 HTML
		private pagingAction page;		//페이징 클래스

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

}
