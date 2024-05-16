package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.complaint.ComplaintVO;
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
	//신고 내용 올리기
	public int setBoardComplaintInput(ComplaintVO vo) {
		int res = 0;
		try {
			sql = "INSERT INTO complaint VALUES(DEFAULT,?,?,?,?,DEFAULT)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setInt(2, vo.getPartIdx());
			pstmt.setString(3, vo.getCpMid());
			pstmt.setString(4, vo.getCpContent());
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
		} finally {
			pstmtClose();
		}
		return res;
	}
	//로그인 한 사람이 신고한 글인지 확인하는 부분
	public String getReport(String part, int idx) {
		String report = "NO";
		try {
			sql = "SELECT * FROM complaint WHERE part=? and partIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, part);
			pstmt.setInt(2, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				report = "OK";
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			rsClose();
		}
		return report;
	}
	//관리자 창 신고 전체 목록 가져오기
	public ArrayList<ComplaintVO> ComplaintList() {
		ArrayList<ComplaintVO> vos = new ArrayList<ComplaintVO>();
		try {
			sql = "SELECT c.*, DATE_FORMAT(c.cpDate, '%Y-%m-%d %H:%i') AS cpDate, b.title, b.nickName, b.mid, b.content FROM complaint c, board b WHERE c.partIdx = b.idx ORDER BY idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ComplaintVO vo = null;
			while(rs.next()) {
				vo = new ComplaintVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setPart(rs.getString("part"));
				vo.setPartIdx(rs.getInt("partIdx"));
				vo.setCpMid(rs.getString("cpMid"));
				vo.setCpDate(rs.getString("cpDate"));
				
				vo.setCpContent(rs.getString("cpContent"));
				vo.setTitle(rs.getString("title"));
				vo.setNickName(rs.getString("nickName"));
				vo.setMid(rs.getString("mid"));
				vos.add(vo);
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			rsClose();
		} 
		return vos;
	}
}
