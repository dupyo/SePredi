package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.dto.NoticeDTO;
import poly.persistance.mapper.BoardMapper;
import poly.persistance.mapper.NoticeMapper;
import poly.service.IBoardService;
import poly.service.INoticeService;

@Service("BoardService")
public class BoardService implements IBoardService{
	
	@Resource(name="BoardMapper")
	private BoardMapper boardMapper;

	@Override
	public List<BoardDTO> getBoardList() throws Exception {
		return boardMapper.getBoardList();
	}

	@Override
	public int insertBoard(BoardDTO bDTO) throws Exception {
		return boardMapper.insertBoard(bDTO);
	}

	@Override
	public int deleteBoard(BoardDTO bDTO) throws Exception {
		return boardMapper.deleteBoard(bDTO);
	}

	@Override
	public BoardDTO getBoardDetail(BoardDTO bDTO) throws Exception {
		return boardMapper.getBoardDetail(bDTO);
	}
	
}
