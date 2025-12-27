package reservation.dao;


import reservation.dto.UserDTO;

public class UserDAOImpl implements UserDAO {

	/* 로그인 - 아이디*/
	@Override
	public UserDTO selectById(String id) {
		// 아이디로 회원 정보 조회하기
		String sql = "SELECT * "
						+ " FROM users"
						+ " WHERE id = ? ";
		// DB 못 찾으면 null 반환
		UserDTO result = null;
		
		try (var con = reservation.utils.DBUtil.getConnection();
			var ps = con.prepareStatement(sql)){
			// con -> DB 연결
			// prepareStatement -> SQL 문으로 물어볼 준비
			ps.setString(1, id);
			
			// 결과가 한 줄이라도 있다면 객체 생성
			try (var rs = ps.executeQuery()) {
				if (rs.next()) {
					UserDTO userId = new UserDTO();
					
					userId.setNo(rs.getInt("no"));
					userId.setId(rs.getString("id"));
					userId.setPassword(rs.getString("password"));
					userId.setEmail(rs.getString("email"));
					userId.setFull_name(rs.getString("full_name"));
					userId.setBirth(rs.getDate("birth"));
					userId.setGender(rs.getString("gender"));
					userId.setNationality(rs.getString("nationality"));
					userId.setPhonenumber(rs.getString("phonenumber"));
					userId.setCreated_at(rs.getTimestamp("created_at"));
					userId.setUpdated_at(rs.getTimestamp("updated_at"));
					
					return userId;
				}
			
			}
		} catch (Exception e) {
			System.err.println("회원 아이디로 조회 시 예외 발생!");
			e.printStackTrace();
		}
		return result;
	}
	
	/* 회원가입 */
	@Override
	public int signup(UserDTO user) {
		int result = 0;
		// 회원 정보 저장
		String sql = " INSERT INTO users(no, id, password, email, full_name, birth, gender, nationality, phonenumber)"
					+ " VALUES (?, ? ,? ,? ,? ,? ,? ,? ,?)" ;
		
		try (var con = reservation.utils.DBUtil.getConnection();
			var ps = con.prepareStatement(sql)) {
			
			ps.setInt(1, user.getNo());
			ps.setString(2, user.getId());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getFull_name());
			ps.setDate(6, user.getBirth());
			ps.setString(7, user.getGender());
			ps.setString(8, user.getNationality());
			ps.setString(9, user.getPhonenumber());
			
			return ps.executeUpdate();
			
		} catch (Exception e) {
			System.err.println("회원 등록 시, 예외 발생!");
			e.printStackTrace();
		}
		// 찾았으면 객체, 없으면 null 반환!
		return result;
	}
	
	/* 마이페이지 회원 조회 */
//	@Override
//	public UserDTO selectId(String id) {
//		// 아이디로 회원 정보 조회하기
//		String sql = "SELECT * "
//						+ " FROM users"
//						+ " WHERE id = ?";
//		
//		UserDTO userid = null;
//		
//		try (var con = reservation.utils.DBUtil.getConnection();
//			var ps = con.prepareStatement(sql)) {
//			
//			ps.setString(1, id);
//			
//			// 결과가 한 줄이라도 있다면 객체 생성
//			try (var rs = ps.executeQuery()) {
//				if (rs.next()) {
//					UserDTO user  = new UserDTO();
//					
//					user.setNo(rs.getInt("no"));
//					user.setId(rs.getString("id"));
//					user.setPassword(rs.getString("password"));
//					user.setEmail(rs.getString("email"));
//					user.setFull_name(rs.getString("full_name"));
//					user.setBirth(rs.getDate("birth"));
//					user.setGender(rs.getString("gender"));
//					user.setNationality(rs.getString("nationality"));
//					user.setPhonenumber(rs.getString("phonenumber"));
//					user.setCreated_at(rs.getTimestamp("created_at"));
//					user.setUpdated_at(rs.getTimestamp("updated_at"));
//					
//					return user;
//				}
//			}
//			
//		} catch (Exception e) {
//			System.err.println("회원 정보 번호로 조회 시 예외 발생!");
//			e.printStackTrace();
//		}
//		// 찾았으면 객체, 없으면 null 반환!
//		return userid;
//		
//	}
	/* 마이페이지 회원 수정 */
	@Override
	public int mypageupdate(UserDTO mypageuser) {
		String sql = " UPDATE users "
					+ " SET password = ? "
					+ "		,full_name = ? "
					+ "		,birth = ?"
					+ " 	,email = ?"
					+ "		,phonenumber = ?"
					+ " 	,gender = ?"
					+ " 	,nationality = ?"
					+ " WHERE id = ?";
		int result = 0;
		
		try (var con = reservation.utils.DBUtil.getConnection();
			var ps = con.prepareStatement(sql)) {
			
			ps.setString(1, mypageuser.getPassword());
			ps.setString(2, mypageuser.getFull_name());
			ps.setDate(3, mypageuser.getBirth());
			ps.setString(4, mypageuser.getEmail());
			ps.setString(5, mypageuser.getPhonenumber());
			ps.setString(6, mypageuser.getGender());
			ps.setString(7, mypageuser.getNationality());
			ps.setString(8,  mypageuser.getId());
			
			return ps.executeUpdate();
			
		} catch (Exception e) {
			System.err.println("회원 정보 수정 시, 예외 발생!");
			e.printStackTrace();
		}
		return result;
	}

	/* 아이디 찾기 */
	@Override
	public String findByNameAndEmail(String name, String email) {

	    String sql = "SELECT id "
	               + "FROM users "
	               + "WHERE full_name = ? AND email = ?";

	    try (var con = reservation.utils.DBUtil.getConnection();
	         var ps = con.prepareStatement(sql)) {

	        ps.setString(1, name);
	        ps.setString(2, email);

	        try (var rs = ps.executeQuery()) {
	            if (rs.next()) {
	                return rs.getString("id");
	            }
	        }

	    } catch (Exception e) {
	        System.err.println("ID 검색 시, 예외 발생!");
	        e.printStackTrace();
	    }

	    return "";
	}

	/* 이름 조회 */
	@Override
	public String findByName(String name) {
		String sql = "SELECT id "
	               + "FROM users "
	               + "WHERE full_name = ?";

	    try (var con = reservation.utils.DBUtil.getConnection();
	         var ps = con.prepareStatement(sql)) {

	        ps.setString(1, name);

	        try (var rs = ps.executeQuery()) {
	            if (rs.next()) {
	                return rs.getString("id");
	            }
	        }

	    } catch (Exception e) {
	        System.err.println("이름 조회 시, 예외 발생!");
	        e.printStackTrace();
	    }
	    return null;
	}

	
	
}
