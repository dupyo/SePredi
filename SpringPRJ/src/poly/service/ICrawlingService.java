package poly.service;


import java.util.List;

import poly.dto.CrawlingDTO;

public interface ICrawlingService {
	public List<CrawlingDTO> getCrawlingDataList(CrawlingDTO cDTO) throws Exception;
	public int insertCrawlingData(CrawlingDTO cDTO) throws Exception;
	public int updadteCrawlingData(CrawlingDTO cDTO) throws Exception;
	public int deleteCrawlingData() throws Exception;
	
}
