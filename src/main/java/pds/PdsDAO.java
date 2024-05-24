package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import admin.AdminVO;
import common.GetConn;

public class PdsDAO {
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
	//자료실의 전체 레코드 건수 구하기
	public int getTotRecCnt(String part) {
		int totRecCnt = 0;
		try {
			if(part.equals("전체")) {
				sql = "SELECT COUNT(*) AS cnt FROM pds";
				pstmt = conn.prepareStatement(sql);
			} else {
				sql = "SELECT COUNT(*) AS cnt FROM pds WHERE part = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
			}
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL오류" + e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}
	//자료실의 part 내용 가져오기
	public List<PdsVO> getPdsList(int startIndexNo, int pageSize, String part) {
		List<PdsVO> vos = new ArrayList<PdsVO>();
		try {
			if(part.equals("전체")) {
				sql = "SELECT *, DATEDIFF(fDate,NOW()) AS date_diff, TIMESTAMPDIFF(HOUR,fDate,NOW()) AS hour_diff FROM pds ORDER BY idx DESC LIMIT ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			} else {
				sql = "SELECT *, DATEDIFF(fDate,NOW()) AS date_diff,TIMESTAMPDIFF(HOUR,fDate,NOW()) AS hour_diff FROM pds WHERE part = ? ORDER BY idx DESC LIMIT ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, part);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PdsVO vo = new PdsVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setPart(rs.getString("part"));
				vo.setfDate(rs.getString("fDate"));
				vo.setDownNum(rs.getInt("downNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setPwd(rs.getString("pwd"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setContent(rs.getString("content"));
				vo.setTitle(rs.getString("title"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
				
				vos.add(vo);
			}
			System.out.println(vos);
			System.out.println(sql);
			System.out.println(startIndexNo+""+pageSize);
		} catch (SQLException e) {
			System.out.println("SQL오류" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	//자료실 업로드 파일의 정보를 DB에 저장시키기
	public int setPdsInputOk(PdsVO vo) {
		int res = 0;
		try {
			sql = "INSERT INTO pds VALUES(DEFAULT,?,?,?,?,?,?,?,DEFAULT,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getfName());
			pstmt.setString(4, vo.getfSName());
			pstmt.setInt(5, vo.getfSize());
			pstmt.setString(6, vo.getTitle());
			pstmt.setString(7, vo.getPart());
			pstmt.setInt(8, vo.getDownNum());
			pstmt.setString(9, vo.getOpenSw());
			pstmt.setString(10, vo.getHostIp());
			pstmt.setString(11, vo.getPwd());
			pstmt.setString(12, vo.getContent());
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
		} finally {
			pstmtClose();
		}
		return res;
	}
	//자료실 idx로 개별 검색
	public PdsVO getpdsIdxSearch(int idx) {
		PdsVO vo = new PdsVO();
		try {
			sql = "SELECT *, DATEDIFF(fDate,NOW()) AS date_diff, TIMESTAMPDIFF(HOUR,fDate,NOW()) AS hour_diff FROM pds WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setPart(rs.getString("part"));
				vo.setfDate(rs.getString("fDate"));
				vo.setDownNum(rs.getInt("downNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setPwd(rs.getString("pwd"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setContent(rs.getString("content"));
				vo.setTitle(rs.getString("title"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
}
