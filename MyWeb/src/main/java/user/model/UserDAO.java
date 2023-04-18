package user.model;

import java.sql.*;
import java.util.*;

import common.util.DBUtil;

/**
 * @author user
 *
 */
public class UserDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public UserDAO() {
		System.out.println("UserDAO()생성자...");
	}// ------------------------------
	

	
	public UserVO loginCheck(String userid, String pwd) throws SQLException, NotUserException {
		UserVO user = selectUserByUserid(userid);
		if(user == null) {
			// 아이디가 없는 경우
			throw new NotUserException(userid + "란 아이디는 존재하지 않습니다.");
		}
		// 비밀번호 일치 체크
		
		String dbPwd = user.getPwd();
		System.out.println("ok");
		
		if(!dbPwd.equals(pwd)) {
			// 비밀번호가 일치하지 않을 경우
			throw new NotUserException("비밀번호가 일치하지 않습니다.");
		}
		System.out.println("ok");
		
		return user;
		
	} // ---------------------------------------------------------------------------------------
	
	public UserVO selectUserByUserid(String userid) throws SQLException{
	      try {
	         con = DBUtil.getCon();
	         StringBuilder buf = new StringBuilder("select member.*, ")
	               .append(" decode(mstate,0,'활동회원',-1,'정지회원',-2,'탈퇴회원',9,'관리자') mstateStr ")
	               .append(" from member where userid = ?");
	         
	         String sql = buf.toString();
	         ps = con.prepareStatement(sql);
	         ps.setString(1, userid);
	         rs = ps.executeQuery();
	         
	         List<UserVO> arr = makeList(rs);
	         if(arr!=null && arr.size()!= 0) {
	            return arr.get(0);
	         }
	         return null;
	      }finally {
	         close();
	      }
	   }
	
	
	/** id 존재를 확인하는 메서드
	 * @param userid
	 * @return boolean
	 * @throws SQLException
	 */
	public boolean idCheck(String userid) throws SQLException {
		try {
			con = DBUtil.getCon();
			String sql = "select idx from member where userid=?"; // unique

			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			// 결과는 있으면 1개 레코드를 반환, 없으면 x

			boolean b = rs.next();
			return !b;
			/*if(b) return false;
			else return true;*/

		} finally {
			close();
		}
	}

	/**
	 * @param user
	 * @return 
	 * @throws SQLException
	 */
	public int insertUser(UserVO user) throws SQLException {
		try {
			con = DBUtil.getCon();
			StringBuilder buf = new StringBuilder("insert into member(");
			buf.append(" idx,name,userid,pwd,hp1,hp2,hp3,").append(" post, addr1, addr2) values(")
					.append(" member_seq.nextval,?,?,?,?,?,?,?,?,?)");
			String sql = buf.toString();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getUserid());
			ps.setString(3, user.getPwd());
			ps.setString(4, user.getHp1());
			ps.setString(5, user.getHp2());
			ps.setString(6, user.getHp3());
			ps.setString(7, user.getPost());
			ps.setString(8, user.getAddr1());
			ps.setString(9, user.getAddr2());
			return ps.executeUpdate();
		} finally {
			close();
		}
	}// insert ------------------------------
	
	public int updateUser(UserVO user) throws SQLException {
		try {
			con = DBUtil.getCon();
			StringBuilder buf = new StringBuilder("update member set name = ?, userid= ?, pwd = ?, hp1 = ?, hp2 = ?, hp3 = ?, ")
					.append(" post = ?, addr1 = ?, addr2 = ?, mstate = ? ")
					.append(" where idx = ?");
					
			String sql = buf.toString();
			System.out.println(sql);
			
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getUserid());
			ps.setString(3, user.getPwd());
			ps.setString(4, user.getHp1());
			ps.setString(5, user.getHp2());
			ps.setString(6, (user.getHp3()).trim());
			ps.setString(7, user.getPost());
			ps.setString(8, user.getAddr1());
			ps.setString(9, user.getAddr2());
			ps.setInt(10, user.getMstate());
			ps.setInt(11, user.getIdx());
			
			return ps.executeUpdate();
			
		}finally {
			close();
		}
	} // -------------------------------------------------------------- updateUser
	
	
	public int deleteUser(int idx) throws SQLException{
		try {
			con = DBUtil.getCon();
//			String sql ="delete from member where idx = ?";
			String sql = "update member set mstate = -2 where idx = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idx);
			
			return ps.executeUpdate();
		}finally {
			close();
		}
		
		
	}// --------------------------------------------------------------- deleteUser

	
	public List<UserVO> listUser() throws SQLException {
		try {
			con = DBUtil.getCon();
			StringBuilder buf = new StringBuilder("select member.*, ")
					.append(" decode(mstate,0,'활동회원',-1,'정지회원',-2,'탈퇴회원',9,'관리자') mstateStr ")
					.append(" from member order by idx desc");
			// String sql="select * from member order by idx desc";
			String sql = buf.toString();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			return makeList(rs);
		} finally {
			close();
		}
	}// -------------------------------

	

	// pk : idx(회원정보)로 회원정보를 가져오는 메서드
	public UserVO selectUserByIdx(int idx) throws SQLException {
		try {
			con = DBUtil.getCon();

			StringBuilder buf = new StringBuilder("select member.*, ")
					.append(" decode(mstate,0,'활동회원',-1,'정지회원',-2,'탈퇴회원',9,'관리자') mstateStr ")
					.append(" from member where idx = ?");

			ps = con.prepareStatement(buf.toString());
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			List<UserVO> arr = makeList(rs);

			if (arr != null && arr.size() == 1) {
				UserVO user = arr.get(0);
				return user;
			}
			return null;

		} finally {
			close();
		}
	}
	// ---------------------------------------

	public List<UserVO> makeList(ResultSet rs) throws SQLException {
		List<UserVO> arr = new ArrayList<>();
		while (rs.next()) {
			int idx = rs.getInt("idx");
			String name = rs.getString("name");
			String userid = rs.getString("userid");
			String pwd = rs.getString("pwd");
			String hp1 = rs.getString("hp1");
			String hp2 = rs.getString("hp2");
			String hp3 = rs.getString("hp3");

			String post = rs.getString("post");
			String addr1 = rs.getString("addr1");
			String addr2 = rs.getString("addr2");

			java.sql.Date indate = rs.getDate("indate");
			int mileage = rs.getInt("mileage");
			int mstate = rs.getInt("mstate");
			String mstateStr = rs.getString("mstateStr");

			UserVO vo = new UserVO(idx, name, userid, pwd, hp1, hp2, hp3, post, addr1, addr2, indate, mileage, mstate,
					mstateStr);
			arr.add(vo);
		} // while -----
		return arr;
	}// makeList ----------------------

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// -------------------------

}////////////////////////////////////////
