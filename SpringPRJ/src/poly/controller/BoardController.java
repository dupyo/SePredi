package poly.controller;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.BoardDTO;
import poly.filter.UrlFilter;
import poly.service.IBoardService;
import poly.service.INoticeService;
import poly.util.CmmUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class BoardController {
	private Logger log = Logger.getLogger(this.getClass());
	
	//WebContent 폴더 밑에 있는 json형식 파일에서 key값에 해당하는 value값 불러오기
	//public static final String clientID = JSONReadFromFile.parseJSON("client_id", "/jsonData/secretKey.json");
	
	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 * */
	
	String msg="";
	String url="";
	
	@Resource(name = "BoardService")
	private IBoardService boardService;
	
	/*
	 * 함수명 위의 value="notice/NoticeList" => /notice/NoticeList.do로 호출되는 url은 무조건 이 함수가 실행된다.
	 * method=RequestMethod.GET => 폼 전송방법을 지정하는 것으로 get방식은 GET, post방식은 POST이다.
	 * method => 기입안하면 GET, POST 모두 가능하나, 가급적 적어주는 것이 좋다.
	 * */
	
	//DB에서 게시판 목록 가져와서 jsp페이지에서 사용
	@RequestMapping(value="boardList")
	public String boardList(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{

		List<BoardDTO> bList = new ArrayList<BoardDTO>();
		bList = boardService.getBoardList();
		model.addAttribute("bList", bList);
		
		System.out.println("board");
		return "/board/boardList";
	}
	
	//게시물 작성 jsp페이지로 이동
	@RequestMapping(value="insertBoard", method=RequestMethod.GET)
	public String insertBoard(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		if (!"".equals(CmmUtil.nvl((String)session.getAttribute("id")))) {
			System.out.println("insert board");
			return "/board/insertBoard";
		} else {
			model.addAttribute("msg", msg="로그인 후 글을 작성할 수 있습니다.");
			model.addAttribute("url", url="/boardList.do");
			return "/alert";
		}
	}
	
	//DB에 게시물 등록 후 게시판 목록 jsp페이지로 이동
	@RequestMapping(value="insertBoardProc", method=RequestMethod.POST)
	public String insertBoardProc(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		String id = CmmUtil.nvl(request.getParameter("id"));
		String title = CmmUtil.nvl(request.getParameter("title"));
		String content = CmmUtil.nvl(request.getParameter("content"));
		BoardDTO bDTO = new BoardDTO();
		bDTO.setId(id);
		bDTO.setTitle(title);
		bDTO.setContent(content);
		int res = boardService.insertBoard(bDTO);
		if (res != 0) {
			model.addAttribute("msg", msg="게시물이 정상적으로 등록되었습니다.");
			model.addAttribute("url", url="/boardList.do");
		} else {
			model.addAttribute("msg", msg="게시물을 등록하는 것에 실패하였습니다.");
			model.addAttribute("url", url="/insertBoard.do");
		}
		
		System.out.println("insert board");
		return "/alert";
		
	}
	
	//DB에서 해당 게시풀 정보를 가져온 후 상세보기 jsp페이지로 이동
	@RequestMapping(value="boardDetail", method=RequestMethod.GET)
	public String boardDetail(BoardDTO bDTO, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		boolean matchSession = false;
		log.info("get boardNo : " + bDTO.getBoardNo());
		log.info("get id : " + bDTO.getId());
		bDTO = boardService.getBoardDetail(bDTO);
		String sid = CmmUtil.nvl((String)session.getAttribute("id"));
		if (!"".equals(sid)) {
			if (bDTO.getId().equals(sid)) {
				matchSession = true;
			}
		}
		
		model.addAttribute("matchSession", matchSession);
		model.addAttribute("bDTO", bDTO);
		System.out.println("detail board");
		return "/board/boardDetail";
	}
	
	//DB에서 해당 게시물 삭제 후 게시판 목록 jsp페이지로 이동
	@RequestMapping(value="deleteBoardProc", method=RequestMethod.GET)
	public String deleteBoardProc(BoardDTO bDTO, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		int res = boardService.deleteBoard(bDTO);
		
		if (res != 0) {
			model.addAttribute("msg", msg="게시물이 정상적으로 삭제되었습니다.");
			model.addAttribute("url", url="/boardList.do");
		} else {
			model.addAttribute("msg", msg="게시물을 등록하는 것에 실패하였습니다.");
			model.addAttribute("url", url="/boardDetail.do?boardNo="+bDTO.getBoardNo()+"&id="+bDTO.getId());
		}
		
		System.out.println("delete board");
		return "/alert";
	}
	
	
	
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
