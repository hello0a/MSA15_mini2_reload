package reservation.service;

import reservation.dao.DesignerDAO;
import reservation.dao.DesignerDAOImple;
import reservation.dto.DesignerDTO;

public class DesignerServiceImpl implements DesignerService{

	private DesignerDAO designerDao = new DesignerDAOImple();
	// 로그인
	@Override
	public DesignerDTO selectById(String id, String pw) {
		// 1. 회원가입 아이디 확인
		DesignerDTO designerDto = designerDao.selectById(id);
		if(designerDto == null) {
			return  null;
		}
		// 2. 비밀번호 일치 여부 확인
		if(!pw.equals(designerDto.getPassword())) {
			return null;
		}
		return designerDto;
	}

	// 회원가입
	@Override
	public int signup(DesignerDTO designer) {
		// 1. 회원가입 내용 필수 항목
		if (designer == null) return 0;
		
		return designerDao.signup(designer);
	}

	// 회원 정보 조회
	@Override
	public int mypageupdate(DesignerDTO designerProfile) {
		return designerDao.mypageupdate(designerProfile);
	}

	// 아이디 찾기
	@Override
	public String findByNameAndEmail(String name, String email) {
		return designerDao.findByNameAndEmail(name, email);
	}

	// 마이페이지 회원 정보 조회
	@Override
	public DesignerDTO getDesigner(String profile) {
		// TODO Auto-generated method stub
		if (profile==null || profile.isEmpty())	{
			return null;
		}
		DesignerDTO designerDto = designerDao.selectById(profile);
		return designerDto;
	}
	
	
	

}
