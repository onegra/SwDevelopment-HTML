package board2;

public class Paging {
	private int page;
	private int perPage;
	private int boardCount;
	private int offset;
	private int fetch; //offset ���� �ҷ��� �Խñ��� �� (==perPage)
	
	private int pageCount; //��ü ������ ����
	private int section; //�������� 10���� ��� �ϳ��� �������� �����ϰ� 0���� ����
	private boolean prev; //���� ������ ������ true
	private boolean next; //���� ������ ������ true
	private int begin; //������ ���� ������
	private int end; //������ �� ������ (pageCount ���� Ŭ �� ����)
	
	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	//�����ڸ� ����� static method
	public static Paging newInstance(int page, int boardCount) {
		return new Paging(page, boardCount);
	}
	
	//boardCount���� Page���븸 �ҷ�����
	public Paging(int page, int boardCount) {
		this.page = page;  //����ڰ� ��û�� ������ ��ȣ : 3
		this.boardCount = boardCount; //DAO�� �̿��Ͽ� �ľ��� �� �Խñ��� ���� :501
		
		perPage = 10; //���� ���� �ٲٸ� ȭ�鿡 ��µǴ� �Խñ��� ������ �ٲ��
		offset = (page - 1) * 10; //(3-1) * 10, 20���� ���ñ��� �ǳʶٰ�
		fetch = perPage; //�� ���� 10���� ȭ�鿡 ����Ѵ�
		
		//�ϴܿ� ������ ��ȣ���� ��ũ�� ����Ҷ� �ʿ��� ��ҵ�
		pageCount = boardCount / perPage; //�������� �� ����� �ľ��ؾ� �Ѵ� 501 / 10
		pageCount += (boardCount % perPage != 0) ? 1 : 0 ; //�������� ������ 1������ �߰�
		section = (page - 1) / 10; //(3-1) /10, 0���� ����(01, 02, 03...)
		begin = section * 10 + 1; // 0 * 10 + 1, 1����������...
		end = begin + 9; // 1 + 9, 10���������� �ϴܿ� �ݺ������� ����Ѵ�
		prev = section != 0; //0�������̶�� ���������� ���� �� �ܿ��� ���������� �ִ�
		next = pageCount > end; //�� ������ ������ ��������������ȣ���� ũ�� ������ �ִ�
								// 50(�� ������ ����) > 50(������ ������ ��ȣ)
		if(end > pageCount) { //������ ������ ��ȣ�� 10������ ���Ȱ����� ������
			end = pageCount; // �� ������ ���� ������ ������ ��ȣ�� �缳���Ѵ�
			next = false; //�� ��� ���������� ����
		}
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getFetch() {
		return fetch;
	}
	public void setFetch(int fetch) {
		this.fetch = fetch;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getSection() {
		return section;
	}
	public void setSection(int section) {
		this.section = section;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	
}
