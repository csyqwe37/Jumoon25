package jumoon25.admin.notice;

import java.util.ArrayList;
import java.util.List;

public class ListDTO {
	//list�κ�
		private List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		private int currentPage = 1; 	//���� ������
		private int totalCount;		 	//�� �Խù��� ��
		private int blockCount = 10;	//�� �������� �Խù� ��
		private int blockPage = 5;		//�� ȭ�鿡 ������ ������ ��
		private String pagingHtml;		//����¡�� ������ HTML
		private pagingAction page;		//����¡ Ŭ����

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
