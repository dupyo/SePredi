package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BoardDTO;
import poly.dto.NoticeDTO;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	public int createUser(UserDTO uDTO) throws Exception;
	public int deleteUser(UserDTO uDTO) throws Exception;
	public UserDTO getUser(UserDTO uDTO) throws Exception;
	public int insertDupl(UserDTO uDTO) throws Exception;
	
}
