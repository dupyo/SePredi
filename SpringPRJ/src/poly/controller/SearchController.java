package poly.controller;

import java.util.ArrayList;
import java.util.Iterator;
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
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import poly.dto.SearchDTO;
import poly.service.ICrawlingService;
import poly.service.ISearchService;
import poly.util.CSVReadFromFile;

@Controller
public class SearchController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="SearchService")
	private ISearchService searchService;
	
	@RequestMapping(value="search")
	public String search(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {
		System.out.println("search.jsp");
		
		
		List<SearchDTO> nationalities = searchService.getNationality();
		List<SearchDTO> leaguenclubs = searchService.getLeagueNClub();
		Iterator<SearchDTO> itleaguenclubs = leaguenclubs.iterator();
		model.addAttribute("nationalities", nationalities);
		model.addAttribute("itleaguenclubs", itleaguenclubs);
		return "/search";
	}
	
	@RequestMapping(value="searchFromCSV", method=RequestMethod.GET)
	public String searchFromCSV(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {
		
		CSVReadFromFile read = new CSVReadFromFile();
		//WebContent폴더 밑에 형이 지정한 파일 경로를 적어주세요 
		List<String[]> data = read.readCSV("/csvfile/data.csv");
		List<String[]> searchList = new ArrayList<String[]>();
		String keywords = request.getParameter("keywords");
		String nationality = "Belgium";
		String club = "Manchester United";
		String listlength = "";
		log.info("keywords : " + keywords);
		
		Iterator<String[]> it = data.iterator();
		while (it.hasNext()) {
			String[] playerInfo = it.next();
			
			if (playerInfo[2].toLowerCase().contains(keywords.toLowerCase()) && 
					playerInfo[5].toLowerCase().contains(nationality.toLowerCase()) &&
					playerInfo[9].toLowerCase().contains(club.toLowerCase())) {
//			if (playerInfo[2].toLowerCase().contains(keywords.toLowerCase())) { 
				
				//검색한 선수의 정보를 List<String[]>형태로 받는다 
				searchList.add(playerInfo);
				//csv파일의 첫번째 컬럼인 일련번호를 가져와서 jsp페이지에서 행의 존재 여부를 판단한다
				listlength = String.valueOf(playerInfo[0].length());
				System.out.println("listlength : " + listlength);
				//행마다 선수 정보가 있는지 선수명으로 확인
				System.out.println("The player's name is " + playerInfo[2]);
			}
//			for (String s : array) {
//				System.out.print(s + " ");
//			}
//			System.out.print("\n");
		}
		Iterator<String[]> itlist = searchList.iterator();
		model.addAttribute("itlist", itlist);
		model.addAttribute("listlength", listlength);
		
		
		return "/search";
	}
	
	/*@RequestMapping(value="googleandNamuwiki")
	public String searchNamuwiki(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws Exception {
		
		String keywords = "그리즈만";
		
		//구글 검색
		String link2 = "https://www.google.com/search?q="+keywords;
		Document doc2 = Jsoup.connect(link2).get(); 
		Elements rowElements2 = doc2.select("div.SPZz6b > div.kno-ecr-pt.kno-fb-ctx.gsmt");
		int line2 = 0;
		String word = "";
		for (Element test2 : rowElements2) {
			line2++;
			System.out.println(line2 + " : " + test2.text());
			word = test2.text();
			System.out.println(test2.text().contains("티아누"));
		}	
		System.out.println(word);
		
		//나무위키 검색
		String link3 = "https://namu.wiki/w/"+keywords;
		Document doc3 = Jsoup.connect(link3).get(); 
		Elements rowElements3 = doc3.select("div.wiki-paragraph > strong > span.wiki-color");
		int line = 0;
		
		for (Element test : rowElements3) {
			line++;
			System.out.println(line + " : " + test.text()); 
		}
		
			
		return null;
	}*/
	
}
