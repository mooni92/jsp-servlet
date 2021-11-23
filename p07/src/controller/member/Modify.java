package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/member/modify")
public class Modify extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/WEB-INF/jsp/member/modify.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		 req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String email = req.getParameter("email");
		String name = req.getParameter("name");

		Member member = new Member(id, pwd, email, name);
		MemberService service = new MemberServiceImpl();
		service.update(member);

		resp.sendRedirect(req.getContextPath() + "/login");

		req.getSession().invalidate();
	}

}
