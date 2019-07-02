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
		System.out.println("uDTO : " + uDTO.getId());
		System.out.println("uDTO : " + uDTO.getName());
		System.out.println("uDTO : " + uDTO.getEmail());
		return userMapper.createUser(uDTO);
	}

	@Override
	public int deleteUser(UserDTO uDTO) throws Exception {
		return userMapper.deleteUser(uDTO);
	}

	@Override
	public UserDTO getUser(UserDTO uDTO) throws Exception {
		System.out.println("uDTO : " + uDTO.getId());
		return userMapper.getUser(uDTO);
	}

	@Override
	public int insertDupl(UserDTO uDTO) throws Exception {
		System.out.println("uDTO : " + uDTO.getId());
		System.out.println("uDTO : " + uDTO.getName());
		System.out.println("uDTO : " + uDTO.getEmail());
		return userMapper.insertDupl(uDTO);
	}

	
	
}
