package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.LoginDAO;
import vo.Member;

public class JoinService {
	
	public int insertMember(Member member) {
		
		LoginDAO loginDAO = LoginDAO.getInstance();
		Connection con = getConnection();
		loginDAO.setConnection(con);
		int joinMember = loginDAO.insertMember(member);
		close(con);
		return joinMember;
	}

}
