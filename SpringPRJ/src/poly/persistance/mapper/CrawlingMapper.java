package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.CrawlingDTO;

@Mapper("CrawlingMapper")
public interface CrawlingMapper {

	public List<CrawlingDTO> getCrawlingDataList(CrawlingDTO cDTO) throws Exception;

	public int insertCrawlingData(CrawlingDTO cDTO) throws Exception;

	public int updadteCrawlingData(CrawlingDTO cDTO) throws Exception;

	public int deleteCrawlingData() throws Exception;
	
}
