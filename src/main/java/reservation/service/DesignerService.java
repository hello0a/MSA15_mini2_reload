package reservation.service;

import reservation.dto.DesignerDTO;

public interface DesignerService {
	// 로그인 : 입력 (id) -> 출력 (UserDTO or null)
		DesignerDTO selectById(String id, String pw);
			
		// 회원가입 : 입력(UserDTO) -> 출력 (성공 수 or boolean)
		int signup(DesignerDTO designer);
		
		// 마이페이지 회원 정보 수정 : 입력(UserDTO) -> 출력(성공 수)
		int mypageupdate(DesignerDTO designerprofile);
		
		// 아이디 찾기 : 이름, 이메일
		String findByNameAndEmail(String name, String email);
		
		// 회원 정보 조회
		DesignerDTO getDesigner(String profile);
}
