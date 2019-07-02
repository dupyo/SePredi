package poly.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;

import poly.dto.UserDTO;
import poly.service.INoticeService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.JSONReadFromFile;
import poly.util.KakaoRestapi;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	//WebContent 폴더 밑에 있는 json형식 파일에서 key값에 해당하는 value값 불러오기
	//public static final String clientID = JSONReadFromFile.parseJSON("client_id", "/jsonfile/secretKey.json");
	
	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 * */
	
	String msg="";
	String url="";
	
	@Resource(name = "UserService")
	private IUserService userService;
	
	/*
	 * 함수명 위의 value="notice/NoticeList" => /notice/NoticeList.do로 호출되는 url은 무조건 이 함수가 실행된다.
	 * method=RequestMethod.GET => 폼 전송방법을 지정하는 것으로 get방식은 GET, post방식은 POST이다.
	 * method => 기입안하면 GET, POST 모두 가능하나, 가급적 적어주는 것이 좋다.
	 * */
	
	
	@RequestMapping(value="accountskakao")
	public String accountkakao(HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model) throws Exception {
		log.info("access accounts.kakao.com");
		return "redirect:https://kauth.kakao.com/oauth/authorize?client_id=2f12756252a402b836eaace8e1fe9934&redirect_uri=http://localhost:8080/kakaologin.do&response_type=code";
	}
	
	//카카오 로그인 후 code값 받고 카카오 계정의 정보 가져올 수 있는 식별자 토큰을 가져온다
	//토큰은 계속 유지됨
	@RequestMapping(value="kakaologin", produces="application/json", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes ra, HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model) throws Exception {
		
		
		System.out.println("kakao code: " + code);
		// JsonNode트리형태로 토큰받아온다
		JsonNode jsonToken = KakaoRestapi.getKakaoAccessToken(code);
		System.out.println("jsonToken : " + jsonToken);
		// 여러 json객체 중 access_token을 가져온다
		JsonNode accessToken = jsonToken.get("access_token");
		JsonNode refreshToken = jsonToken.get("refresh_token");
		System.out.println("access_token : " + accessToken);
		
		//accessToken을 세션에 올린다 
		//return type은 JsonNode 형태
		session.setAttribute("accessToken", accessToken);
		session.setAttribute("refreshToken", refreshToken);
		session.setAttribute("atString", accessToken.toString());
		
		
		JsonNode userInfo = KakaoRestapi.getKakaoUserInfo(accessToken);
		 
		// Get id
		String id = userInfo.path("id").asText(); //사용자의 고유 ID
		String name = "";
		String email = "";
		String has_email = "";
		
		//사용자 정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		
		//사용자 정보에서 가져온 정보를 담은 json객체 확인
		log.info("kakao_account : " + kakao_account);
		log.info("properties : " + properties);
		
		name = properties.path("nickname").asText(); //사용자의 이름
		email = kakao_account.path("email").asText(); //사용자의 이메일	//사용자 정보제공 동의를 하지 않은 경우
		has_email = kakao_account.path("has_email").asText(); 		//has_email=true이지만 이메일을 불러올 수 없음
		
		//테스트로 uDTO 사용자 고유ID, 이름, 이메일 확인
		System.out.println("has_email : " + has_email);
		System.out.println("id : " + id);
		System.out.println("name : " + name); //사용자의 닉네임
		System.out.println("email : " + email); //사용자의 이메일
		
		UserDTO uDTO = new UserDTO();
		uDTO.setId(id);
		int res = 0;
		/*UserDTO getNo = new UserDTO();
		getNo = userService.getUser(uDTO);
		int res = 0;
		if ("".equals(CmmUtil.nvl(String.valueOf(getNo)))) {	//로그인 후 받은 사용자 고유ID로 DB에 저장되어 있는 유저인지 확인 //저장 안 되어 있음->참, 저장되어 있음->거짓
			uDTO.setId(id);
			uDTO.setName(name);
			uDTO.setEmail(email);
			res = userService.createUser(uDTO);
			log.info(res);
		}*/
		uDTO.setId(id);
		uDTO.setName(name);
		uDTO.setEmail(email);
		res = userService.insertDupl(uDTO);
		log.info(res);
		
		//사용자 고유 ID, 이름, 이메일 세션에 올린다
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("email", email);
		
		if (id.isEmpty()) {
			//카카오 정보제공에 실패하면 msg와 url을 model에 올려서 alert로 보낸다
			model.addAttribute("msg", msg="로그인 실패");
			model.addAttribute("url", url="https://kauth.kakao.com/oauth/authorize?client_id=2f12756252a402b836eaace8e1fe9934&redirect_uri=http://localhost:8080/kakaologin.do&response_type=code");
		} else {
			//카카오 정보제공에 성공하면 msg와 url을 model에 올려서 alert로 보낸다
			model.addAttribute("msg", msg="로그인 성공");
			model.addAttribute("url", url="/main.do");
		}
		
		return "/alert";
	}
	
	
	
	//카카오 로그아웃 토큰 삭제하는 방법 필요;;;
	@RequestMapping(value="kakaologout")
	public String kakaoLogout(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {
		
		//로그인 할 때 세션에 올린 토큰을 받아서 요청 url과 함께 post형식으로 요청을 보낸다
		JsonNode accessToken = (JsonNode)session.getAttribute("accessToken");
		log.info("accessToken : " + accessToken);
		JsonNode node2 = KakaoRestapi.kakaoLogout(accessToken);
		//결과 값 출력
		System.out.println("로그아웃 후 반환되는 아이디 : " + node2.get("id"));

		/*log.info("accessToken : " + accessToken);
		JsonNode node1 = KakaoRestapi.disconnectToken(accessToken);
		//결과 값 출력
		System.out.println("앱 연결 해제 후 반환되는 아이디 : " + node1.get("id"));*/
		
		//쿠키 삭제
		Cookie[] cookies = request.getCookies();	//쿠키를 서버에서 요청한다.
		
		for(int i=0; i < cookies.length;i++)	{
			cookies[i].setDomain("kakao.com");
			log.info(cookies[i].getName());
			log.info(cookies[i].getValue());
			cookies[i].setValue(null);
			cookies[i].setMaxAge(0);	//쿠키의 최대수명을 "0"으로 지정해주면 제거 된다. //단위는 sec
			response.addCookie(cookies[i]);   //서버에 추가를 요청한다.(저장은 클라이언트에)
			System.out.println("쿠키를 제거하였습니다.");
		}

		
		//사용자 고유 ID, 이름, 이메일 세션을 삭제하는 대신에 공백으로 비워두면 세션이 안정적으로 관리됨
		session.setAttribute("id", "");
		session.setAttribute("name", "");
		session.setAttribute("email", "");
		session.setAttribute("accessToken", "");
		
		
		return "redirect:http://localhost:8080";
		
	}
	
	//카카오 로그아웃 토큰 삭제하는 방법 필요;;;
	/*@RequestMapping(value="kakaologout", produces="application/json", method=RequestMethod.GET)
	public String kakaoLogout(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {
		
		//model.addAttribute("msg", msg="로그인 성공");
		//model.addAttribute("url", url="/index.do");
		log.info(code);
		JsonNode node = KakaoRestapi.Logout(code);
		//결과 값 출력
		System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
		session.invalidate();
		return "redirect:http://localhost:8080";

	}*/
	
	/**
	 * 게시판 리스트 보여주기
	 * */
	/*@RequestMapping(value="notice/NoticeList", method=RequestMethod.GET)
	public String NoticeList(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		//로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".NoticeList start!");
		
		//공지사항 리스트 가져오기
		List<NoticeDTO> rList = noticeService.getNoticeList();
		
		if (rList==null){
			rList = new ArrayList<NoticeDTO>();
			
		}
		
		//조회된 리스트 결과값 넣어주기
		model.addAttribute("rList", rList);
		
		//변수 초기화(메모리 효율화 시키기 위해 사용함)
		rList = null;
		
		//로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".NoticeList end!");
		
		//함수 처리가 끝나고 보여줄 JSP 파일명(/WEB-INF/view/notice/NoticeList.jsp) 
		return "/notice/NoticeList";
	}*/
}
