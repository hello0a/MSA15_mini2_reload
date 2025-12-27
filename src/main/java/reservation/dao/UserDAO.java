package reservation.dao;

import reservation.dto.UserDTO;

public interface UserDAO{
	// 로그인 : 입력 (id) -> 출력 (UserDTO or null)
	UserDTO selectById(String id);
	
	// 회원가입 : 입력(UserDTO) -> 출력 (성공 수 or boolean)
	int signup(UserDTO user);
	
	// 마이페이지 회원 정보 조회 : 입력(로그인한 유저의 no) -> 출력(UserDTO)
//	UserDTO selectId(String id);
	
	// 마이페이지 회원 정보 수정 : 입력(UserDTO) -> 출력(성공 수)
	int mypageupdate(UserDTO mypageUser);
	
	// 아이디 찾기 : 이름, 이메일
	String findByNameAndEmail(String name, String email);
	
	// 회원 이름 조회 : 이름
	String findByName(String name);

}
