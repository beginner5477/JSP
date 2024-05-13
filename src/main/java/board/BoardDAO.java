package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.AdminVO;
import common.GetConn;

public class BoardDAO {
	Connection conn = GetConn.getConn();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BoardVO vo = null;
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
	//전체 게시글  가져오기
	public ArrayList<BoardVO> getBoardList() {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql = "SELECT * FROM board ORDER BY idx DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				vos.add(vo);
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			rsClose();
		}
		return vos;
	}
	//게시글 등록하기
	public int setBoardInput(BoardVO vo) {
		int res = 0;
		try {
			sql = "INSERT INTO board VALUES (DEFAULT,?,?,?,?,DEFAULT,?,?,DEFAULT,DEFAULT)";
			System.out.println(vo);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
			pstmt.setString(6, vo.getOpenSw());
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.getMessage();
			System.out.println("sql문 오류");
		} finally {
			pstmtClose();
		}
		return res;
	}
}
