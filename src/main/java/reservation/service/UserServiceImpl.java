package reservation.service;

import reservation.dao.UserDAO;
import reservation.dao.UserDAOImpl;
import reservation.dto.UserDTO;

public class UserServiceImpl implements UserService {

	private UserDAO userDao = new UserDAOImpl();
	// 로그인
	@Override
	public UserDTO selectById(String id, String pw) {
		// 1. 회원가입 된 아이디 확인
		UserDTO userDto = userDao.selectById(id);
		if(userDto == null) {
			return null;
		}
		
		// 2. 비밀번호 일치 여부 확인
		if (!pw.equals(userDto.getPassword())) {
			return null;
		}
		return userDto;
	}
	// 아이디찾기
	@Override
	public String findByNameAndEmail(String name, String email) {		
		return userDao.findByNameAndEmail(name, email);
	}
	// 회원가입
	@Override
	public int signup(UserDTO user) {
		// 1. 회원가입 내용 필수항목
		if ( user == null ) return 0;
		
//		if (user.getId() == null || user.getId().isEmpty()) {
//			return 0;
//		}
//		if (user.getPassword() == null || user.getPassword().isEmpty()) {
//			return 0;
//		}
//		if (user.getEmail() == null || user.getEmail().isEmpty()) {
//			return 0;
//		}
		// 2. 휴대전화번호 길이
		
		
		return userDao.signup(user);
//		return 0;
	}
	
	// 마이페이지 회원 정보 조회
	@Override
	public UserDTO getUser(String profile) {
		// TODO Auto-generated method stub
		if (profile==null || profile.isEmpty()) {
			return null;
		}
		UserDTO userDto = userDao.selectById(profile);
		return userDto;
	}
	
	// 마이페이지 회원 정보 수정
	@Override
	public int mypageupdate(UserDTO user) {
		// TODO Auto-generated method stub
		return userDao.mypageupdate(user);
	}
	
	@Override
	public String findByName(String name) {
		// TODO Auto-generated method stub
		return userDao.findByName(name);
	}
	

	
}
