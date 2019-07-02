package poly.dto;

import poly.util.CmmUtil;

/**
 * @author 이협건
 * @version 1.1 공지사항 DTO
 */
public class SearchDTO {

	private String rownum; // 일련번호
	private String id; // 선수 고유 ID
	private String name=""; // 선수명
	private String age; // 나이
	private String photo; // 사진
	private String nationality=""; // 국적
	private String flag; // 국기
	private String league=""; // 리그
	private String club=""; // 클럽명
	private String clublogo; // 클럽로고
	private String position; // 포지션
	private String keywords=""; // 키워드
	
	
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return CmmUtil.nvl(name);
	}
	public void setName(String name) {
		this.name = CmmUtil.nvl(name);
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getNationality() {
		return CmmUtil.nvl(nationality);
	}
	public void setNationality(String nationality) {
		this.nationality = CmmUtil.nvl(nationality);
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getLeague() {
		return league;
	}
	public void setLeague(String league) {
		this.league = league;
	}
	public String getClub() {
		return CmmUtil.nvl(club);
	}
	public void setClub(String club) {
		this.club = CmmUtil.nvl(club);
	}
	public String getClublogo() {
		return clublogo;
	}
	public void setClublogo(String clublogo) {
		this.clublogo = clublogo;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getKeywords() {
		return CmmUtil.nvl(keywords);
	}
	public void setKeywords(String keywords) {
		this.keywords = CmmUtil.nvl(keywords);
	}
	
	
}
