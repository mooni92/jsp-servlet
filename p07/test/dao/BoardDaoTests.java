package dao;

import vo.Board;
import vo.Criteria;

public class BoardDaoTests {
	BoardDao dao = new BoardDao();

	public static void main(String[] args) {
		BoardDaoTests tests = new BoardDaoTests();
		tests.testRead();
		tests.testList();
		tests.testInsert();
		tests.testUpdate();
	}

	public void testRead() {
		Board board = dao.read(186L);
		System.out.println(board);
	}

	public void testList() {
		dao.list(new Criteria(1, 20)).forEach(System.out::println);
	}

	public void testInsert() {
		Board board = new Board("테스트용입니다", "테스트테스트", "admin", 2L);
		dao.insert(board);
		System.out.println(board);
	}

	public void testUpdate() {
		dao.update(new Board(2L, "수정글입니다.", "수정내용입니다."));
		System.out.println(dao.read(2L));
	}
}
