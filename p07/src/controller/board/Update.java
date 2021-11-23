package controller.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import service.BoardService;
import service.BoardServiceImpl;
import util.MyFileRenamePolicy;
import vo.Attach;
import vo.Board;
import vo.Member;

@WebServlet("/board/update")
public class Update extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long bno = Long.parseLong(req.getParameter("bno"));

		String id = ((Member) req.getSession().getAttribute("member")).getId();

		HttpSession session = req.getSession();
		session.setAttribute("board", new BoardServiceImpl().read(bno));
		req.getRequestDispatcher("/WEB-INF/jsp/board/update.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String title = req.getParameter("title");
		String content = req.getParameter("content");
		Long bno = Long.parseLong(req.getParameter("bno"));
		Board board = new Board(bno,title, content);
		BoardServiceImpl service = new BoardServiceImpl();

		service.modify(board);
		resp.sendRedirect("list");

	}

}
