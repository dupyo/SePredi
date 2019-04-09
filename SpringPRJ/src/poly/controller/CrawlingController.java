package poly.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import poly.service.ICrawlingService;

@Controller
public class CrawlingController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CrawlingService")
	private ICrawlingService crawlingService;
	
}
