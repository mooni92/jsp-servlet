package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.List;

import util.DBConn;
import vo.Attach;
import vo.Board;
import vo.Criteria;
import vo.Member;

public class BoardDao {

	public Long insert(Board board) {
		Connection conn = DBConn.getConnection();
		Long bno = null;
		try {
			conn.setAutoCommit(false);

			// 글 번호를 먼저 발급
			ResultSet rs = conn.prepareStatement("SELECT SEQ_BOARD.NEXTVAL FROM DUAL").executeQuery();
			rs.next();
			bno = rs.getLong(1);

			// 글 작성
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO TBL_BOARD(BNO, TITLE, CONTENT, ID, CATEGORY) VALUES (?, ?, ?, ?, ?)");
			int idx = 1;
			pstmt.setLong(idx++, bno);
			pstmt.setString(idx++, board.getTitle());
			pstmt.setString(idx++, board.getContent());
			pstmt.setString(idx++, board.getId());
			pstmt.setLong(idx++, board.getCategory());

			// select : executeQuery, insert update delete : executeUpdate
			pstmt.executeUpdate();
			conn.commit();
			conn.setAutoCommit(true);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bno;
	}

	public Board read(Long bno) {
		Connection conn = DBConn.getConnection();
		Board board = null;
		try {
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT BNO, TITLE, CONTENT, REGDATE, ID, CATEGORY FROM TBL_BOARD WHERE BNO=?");
			pstmt.setLong(1, bno);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				int idx = 1;
				board = new Board(rs.getLong(idx++), rs.getString(idx++), rs.getString(idx++), rs.getDate(idx++),
						rs.getString(idx++), rs.getLong(idx++), null, null);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return board;
	}

	public List<Board> list() {
		Connection conn = DBConn.getConnection();
		List<Board> list = new ArrayList<Board>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"SELECT BNO, TITLE, REGDATE, ID, CATEGORY FROM TBL_BOARD WHERE BNO > 0 ORDER BY 1 DESC");

			while (rs.next()) {
				int idx = 1;
				Long bno = rs.getLong(idx++);
				String title = rs.getString(idx++);
//	            String content = rs.getString(idx++);
				Date regDate = rs.getDate(idx++);
				String id = rs.getString(idx++);
				Long category = rs.getLong(idx++);

				Board board = new Board(bno, title, regDate, id, category);
				list.add(board);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 글 수정
	public void update(Board board) {
		Connection conn = DBConn.getConnection();
		try {
			// 글 작성
			PreparedStatement pstmt = conn
					.prepareStatement("UPDATE TBL_BOARD SET TITLE = ?, CONTENT = ? WHERE BNO = ?");
			int idx = 1;
			pstmt.setString(idx++, board.getTitle());
			pstmt.setString(idx++, board.getContent());
			pstmt.setLong(idx++, board.getBno());

			// select : executeQuery, insert update delete : executeUpdate
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 게시글 삭제
	public void delete(Long bno) {
		Connection conn = DBConn.getConnection();
		try {
			// 글 작성
			PreparedStatement pstmt = conn.prepareStatement("DELETE TBL_BOARD WHERE BNO=?");
			int idx = 1;
			pstmt.setLong(idx++, bno);

			// select : executeQuery, insert update delete : executeUpdate
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 게시글에 달린 댓글 삭제
	public void deleteReply(Long bno) {
		Connection conn = DBConn.getConnection();
		try {
			// 글 작성
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM TBL_REPLY  WHERE BNO=?");
			int idx = 1;
			pstmt.setLong(idx++, bno);

			// select : executeQuery, insert update delete : executeUpdate
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 게시글에 달린 첨부파일 삭제
	public void deleteAttach(Long bno) {
		Connection conn = DBConn.getConnection();
		try {
			// 글 작성
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM TBL_ATTACH WHERE BNO=?");
			int idx = 1;
			pstmt.setLong(idx++, bno);

			// select : executeQuery, insert update delete : executeUpdate
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 첨부 파일
	public void writeAttach(Attach attach) {
		Connection conn = DBConn.getConnection();
		try {
			// 글 작성
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO TBL_ATTACH VALUES (?, ?, ?, ?)");
			int idx = 1;

			pstmt.setString(idx++, attach.getUuid());
			pstmt.setString(idx++, attach.getOrigin());
			pstmt.setLong(idx++, attach.getBno());
			pstmt.setString(idx++, attach.getPath());

			// select : executeQuery, insert update delete : executeUpdate
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Attach> readAttach(Long bno) {
		Connection conn = DBConn.getConnection();
		List<Attach> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT UUID, ORIGIN, PATH, BNO FROM TBL_ATTACH WHERE BNO=?");
			pstmt.setLong(1, bno);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int idx = 1;
				String uuid = rs.getString(idx++);
				String origin = rs.getString(idx++);
				String path = rs.getString(idx++);

				Attach attach = new Attach(uuid, origin, bno, path);
				list.add(attach);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
//         System.out.println(this.getClass().getCanonicalName()+ ".readAttach("+bno+")");

		return list;
	}

	public List<Attach> readAttachByPath(String path) {
		Connection conn = DBConn.getConnection();
		List<Attach> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT UUID, ORIGIN, PATH FROM TBL_ATTACH WHERE PATH=?");
			pstmt.setString(1, path);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int idx = 1;
				String uuid = rs.getString(idx++);
				String origin = rs.getString(idx++);

				Attach attach = new Attach(uuid, origin, null, path);
				list.add(attach);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
//         System.out.println(this.getClass().getCanonicalName()+ ".readAttach("+bno+")");

		return list;
	}

	public String findOriginBy(String uuid) {
		Connection conn = DBConn.getConnection();
		String origin = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT ORIGIN FROM TBL_ATTACH WHERE UUID=?");
			pstmt.setString(1, uuid);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				origin = rs.getString(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return origin;
	}

	public List<Board> list(Criteria cri) {
		Connection conn = DBConn.getConnection();
		List<Board> list = new ArrayList<>();
		try {

			StringBuilder sql = new StringBuilder();
			sql.append("WITH B AS (\r\n");
			sql.append("   SELECT /*+ INDEX_DESC(TB PK_BOARD) */\r\n");
			sql.append("      ROWNUM RN,TB.*\r\n");
			sql.append("   FROM TBL_BOARD TB\r\n");
			sql.append("   WHERE BNO >0 \r\n");
			sql.append("   AND CATEGORY = ?\r\n");
			sql.append("   AND ROWNUM <= ?*?\r\n");
//          sql.append   ("   ORDER BY BNO DESC\r\n"); 
			sql.append(")\r\n");
			sql.append("SELECT BNO, TITLE, REGDATE , ID, CATEGORY, ");
			sql.append("(SELECT COUNT(*) FROM TBL_REPLY R WHERE R.BNO = B.BNO) REPLYCNT,");
			sql.append("CONTENT FROM B\r\n");
			sql.append("WHERE RN > (? - 1) * ?");

			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			int idx = 1;
			pstmt.setInt(idx++, cri.getCategory());
			pstmt.setInt(idx++, cri.getPageNum());
			pstmt.setInt(idx++, cri.getAmount());
			pstmt.setInt(idx++, cri.getPageNum());
			pstmt.setInt(idx++, cri.getAmount());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				idx = 1;
				Long bno = rs.getLong(idx++);
				String title = rs.getString(idx++);
				Date regDate = rs.getDate(idx++);
				String id = rs.getString(idx++);
				Long category = rs.getLong(idx++);

				Board board = new Board(bno, title, regDate, id, category);
				board.setReplyCnt(rs.getInt(idx++));
				list.add(board);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void main(String[] args) {
		BoardDao dao = new BoardDao();

		// 글 작성 테스트
//         Long bno= new BoardDao().insert(new Board(null, "커피", 
//               "카페", null, "babam", 1L));
//         System.out.println(bno);

		// 단일 조회 테스트
//         System.out.println(dao.read(10L));

		// 목록 조회 테스트
//         dao.list().forEach(System.out::println);

		// 업데이트 테스트

//         dao.update(new Board(1L, "수정글입니다.", "수정내용입니다."));
//         System.out.println(dao.read(1L));

		// 페이지 테스트
//         dao.list(new Criteria(1,10)).forEach(System.out::println);
	}

	public int getCount(Criteria cri) {
		Connection conn = DBConn.getConnection();
		int count = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT COUNT(*) FROM TBL_BOARD WHERE CATEGORY = ?");
			pstmt.setInt(1, cri.getCategory());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}