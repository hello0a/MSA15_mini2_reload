package reservation.service;

import reservation.dto.UserDTO;

public interface UserService {
	// 로그인
	UserDTO selectById(String id, String pw);
	// 아이디찾기
	String findByNameAndEmail(String name, String email);
	// 이름 조회
	String findByName(String name);
	// 회원가입
	int signup(UserDTO user);
	// 마이페이지 회원 정보 조회
	UserDTO getUser(String profile);
	// 마이페이지 회원 정보 수정
	int mypageupdate(UserDTO mypageUser);
	
}
