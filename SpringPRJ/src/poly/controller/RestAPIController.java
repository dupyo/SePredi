package poly.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestAPIController {

	@RequestMapping(value="/rest/kim")
	public String kim() throws Exception{
		
		//크롤링 로직 
		//json 
		return  "{ key: value}";
	}
	
}
