package poly.dto;

import com.fasterxml.jackson.databind.JsonNode;

/**
 * @author 홍두표
 * @version 1.1 공지사항 DTO
 */
public class UserDTO {

	private String id;	//사용자 고유 ID(PK)
	private String name;	//이름
	private String email;	//이메일
	private JsonNode accessToken;	//이름
	private String corp;	//소셜로그인 계정 종류
	private String regDate;	//등록일
	private String regNo;	//등록자회원번호
	private String updDate;	//수정일
	private String updNo;	//수정자회원번호
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public JsonNode getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(JsonNode accessToken) {
		this.accessToken = accessToken;
	}
	public String getCorp() {
		return corp;
	}
	public void setCorp(String corp) {
		this.corp = corp;
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
