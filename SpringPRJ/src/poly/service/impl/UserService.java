package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.dto.NoticeDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.BoardMapper;
import poly.persistance.mapper.NoticeMapper;
import poly.persistance.mapper.UserMapper;
import poly.service.IBoardService;
import poly.service.INoticeService;
import poly.service.IUserService;

@Service("UserService")
public class UserService implements IUserService{
	
	@Resource(name="UserMapper")
	private UserMapper userMapper;

	@Override
	public int createUser(UserDTO uDTO) throws Exception {
		return userMapper.createUser(uDTO);
	}

	@Override
	public int deleteUser(UserDTO uDTO) throws Exception {
		return userMapper.deleteUser(uDTO);
	}

	@Override
	public UserDTO getUser(UserDTO uDTO) throws Exception {
		return userMapper.getUser(uDTO);
	}

	
	
}
