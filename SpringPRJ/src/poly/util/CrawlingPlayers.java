package poly.util;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class CrawlingPlayers {
	
	//구글에서 한글 찾고 나무위키에서 검색
	public static String search(String keywords) throws Exception {
		String keyword = "";
		System.out.println("namu,wiki start1 !!!!");
		//구글 검색
		keyword = crawlingKR(keywords);
		System.out.println("namu,wiki start2 !!!!");
		
		//나무위키 검색
		String link3 = "https://namu.wiki/w/"+keyword;
		Document doc3 = Jsoup.connect(link3).get();
		Elements rowElements3 = doc3.select("div.wiki-paragraph > strong > span.wiki-color");
		for (Element test : rowElements3) {
			System.out.println(" : " + test.text());
			keyword += test.text() + " ";
		}
		System.out.println("namu,wiki end !!!!");
		String[] words = keyword.split(" ");
		String dataType = "";
		String returnKeyword = "";
		for (String word : words) {
			dataType = DataType.getType(word);
			if (!dataType.equals("kr") && !dataType.equals("nu") && !dataType.equals("specialchar") && !dataType.equals("star")) {
				
				returnKeyword += word + " ";
			}
		}
		System.out.println(returnKeyword);
		return returnKeyword;
	}
	
	//구글에서 한글 찾고 나무위키 url 찾기
	public static String searchUrl(String keywords) throws Exception {
		String keyword = "";
		String url = "";
		//구글 검색
		keyword = crawlingKR(keywords);
		
		//나무위키 검색
		String link2 = "https://www.google.com/search?q="+keyword;
		Document doc2 = Jsoup.connect(link2).get(); 
		Elements rowElements2 = doc2.select("cite.iUh30");
		int line2 = 0;
		for (Element test2 : rowElements2) {
			line2++;
			if (test2.text().contains("namu.wiki")) {
				url = test2.text();
				System.out.println(url);
			}
		}
		
		return url;
	}
	
	//구글 검색해서 한국어 크롤링
	public static String crawlingKR(String keywords) throws Exception {
		String keyword = "";
		String link2 = "https://www.google.com/search?q="+keywords;
		Document doc2 = Jsoup.connect(link2).get(); 
		Elements rowElements2 = doc2.select("div.SPZz6b > div.kno-ecr-pt.kno-fb-ctx.gsmt");
		int line2 = 0;
		for (Element test2 : rowElements2) {
			line2++;
			System.out.println(line2 + " : " + test2.text());
			keyword = test2.text();
		}	
		System.out.println("crawlingKR : "+keyword);
		
		return keyword;
	}
	
	//나우위키에서 선수 상세정보 HTML태그 크롤링
	public static String crawlingNamu(String keywords) throws Exception {
		String keyword = "";
		//구글 검색
		keyword = crawlingKR(keywords);
		
		//나무위키 검색
		String link3 = "https://namu.wiki/w/"+keyword;
		Document doc3 = Jsoup.connect(link3).get(); 
		Elements rowElements3 = doc3.select("div.wiki-table-wrap.table-right");
		
		
		return rowElements3.toString();
	}
	
	
	
}
