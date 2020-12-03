package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.Member;

public class LoginDAO {

	private static LoginDAO loginDAO;
	private Connection con;

	private LoginDAO() {

	}

	public static LoginDAO getInstance() {
		if (loginDAO == null) {
			loginDAO = new LoginDAO();
		}
		return loginDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public Member selectLoginMember(String id, String passwd) {

		Member loginMember = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("select * from member where id = ? and passwd = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				loginMember = new Member();
				loginMember.setId(rs.getString("id"));
				loginMember.setPasswd(rs.getString("passwd"));
				loginMember.setName(rs.getString("name"));
				loginMember.setAge(rs.getInt("age"));
				loginMember.setGender(rs.getString("gender"));
				loginMember.setEmail(rs.getString("email"));
				loginMember.setAddr(rs.getString("addr"));
			}
			commit(con);
		} catch (Exception e) {
			rollback(con);
			e.printStackTrace();
		} finally {
			try {
				close(rs);
				close(pstmt);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return loginMember;
	}

	public int insertMember(Member member) {
		PreparedStatement pstmt = null;
		int joinMember = 0;
		try {
			String sql = "insert into member values (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5, member.getGender());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getAddr());
			joinMember = pstmt.executeUpdate();
			commit(con);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				close(pstmt);
		}
		return joinMember;
	}
}