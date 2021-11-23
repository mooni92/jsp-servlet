package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import service.BoardServiceImpl;

@WebServlet("/notice/delete")
public class Delete extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long bno = Long.parseLong(req.getParameter("bno"));
		
		BoardService service = new BoardServiceImpl();
		service.removeReply(bno);
		service.removeAttach(bno);
		service.remove(bno);
//		req.getRequestDispatcher("/WEB-INF/jsp/notice/list.jsp").forward(req, resp);
		
		resp.sendRedirect("list");
	}
	
	

}
