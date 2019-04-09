package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.CrawlingDTO;
import poly.persistance.mapper.CrawlingMapper;
import poly.service.ICrawlingService;


@Service("CrawlingService")
public class CrawlingService implements ICrawlingService {
	
	@Resource(name="CrawlingMapper")
	private CrawlingMapper crawlingMapper;

	@Override
	public List<CrawlingDTO> getCrawlingDataList(CrawlingDTO cDTO) throws Exception {
		return crawlingMapper.getCrawlingDataList(cDTO);
	}

	@Override
	public int insertCrawlingData(CrawlingDTO cDTO) throws Exception {
		return crawlingMapper.insertCrawlingData(cDTO);
	}

	@Override
	public int updadteCrawlingData(CrawlingDTO cDTO) throws Exception {
		return crawlingMapper.updadteCrawlingData(cDTO);
	}

	@Override
	public int deleteCrawlingData() throws Exception {
		return crawlingMapper.deleteCrawlingData();
	}
	
}
