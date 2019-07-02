package poly.service;

import java.util.List;

import poly.dto.BoardDTO;
import poly.dto.NoticeDTO;
import poly.dto.UserDTO;

public interface IUserService {
	public int createUser(UserDTO uDTO) throws Exception;
	public int deleteUser(UserDTO uDTO) throws Exception;
	public UserDTO getUser(UserDTO uDTO) throws Exception;
	public int insertDupl(UserDTO uDTO) throws Exception;
}
