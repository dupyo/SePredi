package poly.service;

import java.util.List;

import poly.dto.NoticeDTO;
import poly.dto.SearchDTO;

public interface ISearchService {
	public List<SearchDTO> getNationality() throws Exception;
	public List<SearchDTO> getLeagueNClub() throws Exception;
	public List<SearchDTO> searchPlayersKNC(SearchDTO sDTO) throws Exception;
	public List<SearchDTO> searchPlayersNC(SearchDTO sDTO) throws Exception;
	public List<SearchDTO> searchPlayersDefault() throws Exception;
}
