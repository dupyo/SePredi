package poly.service;

import java.util.List;

import poly.dto.BoardDTO;
import poly.dto.NoticeDTO;

public interface IBoardService {
	public List<BoardDTO> getBoardList() throws Exception;
	public int insertBoard(BoardDTO bDTO) throws Exception;
	public int deleteBoard(BoardDTO bDTO) throws Exception;
	public BoardDTO getBoardDetail(BoardDTO bDTO) throws Exception;
}
