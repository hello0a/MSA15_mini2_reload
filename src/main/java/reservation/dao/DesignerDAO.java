package reservation.dao;

import reservation.dto.DesignerDTO;

public interface DesignerDAO {
	// 로그인 : 입력 (id) -> 출력 (UserDTO or null)
	DesignerDTO selectById(String id);
		
	// 회원가입 : 입력(UserDTO) -> 출력 (성공 수 or boolean)
	int signup(DesignerDTO designer);
	
	// 마이페이지 회원 정보 수정 : 입력(UserDTO) -> 출력(성공 수)
	int mypageupdate(DesignerDTO designerProfile);
	
	// 아이디 찾기 : 이름, 이메일
	String findByNameAndEmail(String name, String email);

}
