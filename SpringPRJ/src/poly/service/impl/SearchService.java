package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.SearchDTO;
import poly.persistance.mapper.SearchMapper;
import poly.service.ISearchService;

@Service("SearchService")
public class SearchService implements ISearchService {
	
	@Resource(name="SearchMapper")
	private SearchMapper searchMapper;
	
	@Override
	public List<SearchDTO> getNationality() throws Exception {
		System.out.println("--------------getNationality");
		return searchMapper.getNationality();
	}
	
	@Override
	public List<SearchDTO> getLeagueNClub() throws Exception {
		System.out.println("--------------getLeagueNClub");
		return searchMapper.getLeagueNClub();
	}
	
}
