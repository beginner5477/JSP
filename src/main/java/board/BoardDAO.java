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
	public ArrayList<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql = "SELECT *,TIMESTAMPDIFF(HOUR,wDate,NOW()) AS hour_diff, DATEDIFF(wDate,NOW()) AS date_diff FROM board ORDER BY idx DESC LIMIT ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
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
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
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
	//게시글 내용 보내주기
	public BoardVO getBoardContent(int idx) {
		BoardVO vo = new BoardVO();
		try {
			sql = "SELECT * FROM board WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			rsClose();
		}
		return vo;
	}
	//조회수 증가 처리
	public void setBoardReadNumPlus(int idx) {
		try {
			sql = "UPDATE board SET readNum = readNum + 1 WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
		} finally {
			pstmtClose();
		}
	}
	//게시글 삭제하기
	public int setBoardDelete(int idx) {
		int res = 0;
		try {
			sql = "DELETE FROM board WHERE idx = ?";
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
	//게시글의 총 기록 건수
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "SELECT COUNT(*) AS cnt FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (Exception e) {
			e.getMessage();
		} finally {
			rsClose();
		}
		return totRecCnt;
	}
	//내용창에서 이전글 다음글 idx title 가져오기
	public BoardVO getPreNextSearch(int idx, String str) {
		BoardVO vo = new BoardVO();
		try {
			if(str.equals("preVo"))
			sql = "SELECT idx,title FROM board WHERE idx < ? ORDER BY idx DESC LIMIT 1";
			else
			sql = "SELECT idx,title FROM board WHERE idx > ? ORDER BY idx ASC LIMIT 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			rsClose();
		}
		return vo;
	}
	//좋아요 수 증가처리
	public int setBoardGoodCheck(int idx) {
		int res = 0;
		try {
			sql = "UPDATE board SET good = good + 1 WHERE idx = ?";
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
	//게시글 수정하기
	public int setBoardUpdateOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "UPDATE board SET title=?,content=?,openSw=?,hostIp=?,wDate=NOW() WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getOpenSw());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setInt(5, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
		} finally {
			pstmtClose();
		}
		return res;
	}
	//게시글의 댓글 내용 가져오기
	public ArrayList<BoardReplyVO> getBoardReply(int idx) {
		ArrayList<BoardReplyVO> replyVos = new ArrayList<BoardReplyVO>();
		try {
			sql = "SELECT * FROM boardReply WHERE boardIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			BoardReplyVO vo = null;
			while(rs.next()) {
				vo = new BoardReplyVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setBoardIdx(rs.getInt("boardIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setContent(rs.getString("content"));
				replyVos.add(vo);
			}
		} catch (Exception e) {
			e.getMessage();
		} finally {
			rsClose();
		}
		return replyVos;
	}
	//댓글 등록시키기
	public int setReplyInput(BoardReplyVO vo) {
		int res = 0;
		try {
			System.out.println(vo);
			sql = "INSERT INTO boardReply VALUES (DEFAULT,?,?,?,DEFAULT,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoardIdx());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setString(5, vo.getContent());
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.getMessage();
		} finally {
			pstmtClose();
		}
		return res;
	}
	//댓글 삭제 처리하기
	public int setBoardReplyDelete(int idx) {
		int res = 0;
		try {
			sql = "DELETE FROM boardReply WHERE idx = ?";
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
}
