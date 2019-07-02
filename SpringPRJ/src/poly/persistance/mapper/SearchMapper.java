package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.NoticeDTO;
import poly.dto.SearchDTO;

@Mapper("SearchMapper")
public interface SearchMapper {
	
	public List<SearchDTO> getNationality() throws Exception;
	public List<SearchDTO> getLeagueNClub() throws Exception;
	public List<SearchDTO> searchPlayersKNC(SearchDTO sDTO) throws Exception;
	public List<SearchDTO> searchPlayersNC(SearchDTO sDTO) throws Exception;
	public List<SearchDTO> searchPlayersDefault() throws Exception;
	
}
