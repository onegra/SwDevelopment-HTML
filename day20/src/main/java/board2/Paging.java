package board2;

public class Paging {
	private int page;
	private int perPage;
	private int boardCount;
	private int offset;
	private int fetch; //offset 이후 불러올 게시글의 수 (==perPage)
	
	private int pageCount; //전체 페이지 개수
	private int section; //페이지를 10개씩 묶어서 하나의 구역으로 설정하고 0부터 시작
	private boolean prev; //이전 구역이 있으면 true
	private boolean next; //다음 구역이 있으면 true
	private int begin; //구역의 시작 페이지
	private int end; //구역의 끝 페이지 (pageCount 보다 클 수 없음)
	
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

	//생성자를 대신할 static method
	public static Paging newInstance(int page, int boardCount) {
		return new Paging(page, boardCount);
	}
	
	//boardCount에서 Page내용만 불러오기
	public Paging(int page, int boardCount) {
		this.page = page;  //사용자가 요청한 페이지 번호 : 3
		this.boardCount = boardCount; //DAO를 이용하여 파악한 총 게시글의 개수 :501
		
		perPage = 10; //여기 값을 바꾸면 화면에 출력되는 게시글의 개수가 바뀐다
		offset = (page - 1) * 10; //(3-1) * 10, 20개의 개시글은 건너뛰고
		fetch = perPage; //그 다음 10개를 화면에 출력한다
		
		//하단에 페이지 번호들을 링크로 출력할때 필요한 요소들
		pageCount = boardCount / perPage; //페이지가 총 몇개인지 파악해야 한다 501 / 10
		pageCount += (boardCount % perPage != 0) ? 1 : 0 ; //나머지가 있으면 1페이지 추가
		section = (page - 1) / 10; //(3-1) /10, 0번대 구역(01, 02, 03...)
		begin = section * 10 + 1; // 0 * 10 + 1, 1페이지부터...
		end = begin + 9; // 1 + 9, 10페이지까지 하단에 반복문으로 출력한다
		prev = section != 0; //0번구역이라면 이전구역이 없다 그 외에는 이전구역이 있다
		next = pageCount > end; //총 페이지 개수가 마지막페이지번호보다 크면 다음이 있다
								// 50(총 페이지 개수) > 50(마지막 페이지 번호)
		if(end > pageCount) { //마지막 페이지 번호가 10단위로 계산된값보다 작으면
			end = pageCount; // 총 페이지 수를 마지막 페이지 번호로 재설정한다
			next = false; //이 경우 다음구역은 없다
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
