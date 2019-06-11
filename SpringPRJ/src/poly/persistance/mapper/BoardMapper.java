package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;
import poly.dto.NoticeDTO;

@Mapper("BoardMapper")
public interface BoardMapper {
	public List<BoardDTO> getBoardList() throws Exception;
	public int insertBoard(BoardDTO bDTO) throws Exception;
	public int deleteBoard(BoardDTO bDTO) throws Exception;
	public BoardDTO getBoardDetail(BoardDTO bDTO) throws Exception;
	
}
