package poly.dto;

/**
 * @author 이협건
 * @version 1.1 공지사항 DTO
 */
public class BoardDTO {

	private String boardNo; // 기본키, 순번
	private String id; // 작성자(kakao고유ID)
	private String userName; // 작성자(kakao고유ID)
	private String title; // 제목
	private String content; // 글 내용
	private String regDate; // 등록일
	private String regNo; // 등록자 아이디
	private String updDate; // 수정일
	private String updNo; // 수정자 아이디
	
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
	public String getUpdNo() {
		return updNo;
	}
	public void setUpdNo(String updNo) {
		this.updNo = updNo;
	}
	
	
	

}
