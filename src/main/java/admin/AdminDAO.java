package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class AdminDAO {
	Connection conn = GetConn.getConn();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	AdminVO vo = null;
	String sql = "";
	
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	//회원 정보 등급별로 반환 시켜주는곳
	public ArrayList<AdminVO> getMemberList(int showLevel) {
		ArrayList<AdminVO> vos = new ArrayList<AdminVO>();
		try {
			if(showLevel == 999) {
				sql = "SELECT *, TIMESTAMPDIFF(DAY, lastDate, NOW()) AS deleteDiff FROM member";
			} else {
				sql = "SELECT *, TIMESTAMPDIFF(DAY, lastDate, NOW()) AS deleteDiff FROM  member WHERE level = ?";
			}
			pstmt = conn.prepareStatement(sql);
			if(showLevel != 999) {
				pstmt.setInt(1, showLevel);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new AdminVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setGender(rs.getString("gender"));
				vo.setLevel(rs.getInt("level"));
				vo.setDeleteDiff(rs.getInt("deleteDiff"));
				vos.add(vo);
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			rsClose();
		}
		return vos;
	}
	public int setMemberLevelChange(int idx, int level) {
		int res = 0;
		try {
			sql = "UPDATE member SET level = ? WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
		} finally {
			pstmtClose();
		}
		return res;
	}
	//회원 삭제 부분
	public int MemberDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "DELETE FROM member WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
		} finally {
			pstmtClose();
		}
		return res;
	}
	//선택한 전체 회원 등급 변경하기
	public int setAllMemberChange(String level, String list) {
		int res = 0;
		try {
			String[] listArr = list.split("/");
			for(int i = 0; i < listArr.length; i++) {
				if(!listArr[i].equals("1")) {
					sql = "UPDATE member SET level = ? WHERE idx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, Integer.parseInt(level) );
					pstmt.setInt(2, Integer.parseInt(listArr[i]));
					res = pstmt.executeUpdate();
					if(level.equals("99")) {
						sql = "UPDATE member SET userDel = 'OK' WHERE idx = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, Integer.parseInt(listArr[i]) );
						pstmt.executeUpdate();
					} else {
						sql = "UPDATE member SET userDel = 'NO' WHERE idx = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, Integer.parseInt(listArr[i]) );
						pstmt.executeUpdate();
					}
				}
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			pstmtClose();
		}
		return res;
	}
}
