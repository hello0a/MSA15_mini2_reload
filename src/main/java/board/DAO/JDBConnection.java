package board.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/aloha?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
    private static final String USER = "aloha";
    private static final String PASSWORD = "123456";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("JDBC 드라이버 로드 성공!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // 기존 방식 (인스턴스 사용)
    public Connection con;
    public PreparedStatement psmt;
    public ResultSet rs;

    public JDBConnection() {
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("DB 연결 성공!");
        } catch (Exception e) {
            System.err.println("DB 연결 실패!");
            e.printStackTrace();
        }
    }

    public void close() {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (psmt != null) psmt.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }

    // 2️⃣ DAO에서 바로 쓸 수 있는 static 메서드 추가
    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
