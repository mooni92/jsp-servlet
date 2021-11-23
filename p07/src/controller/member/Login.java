
package controller.member;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/login")
public class Login extends HttpServlet {
// doGet /doPost 같은화면에서 다른작업

//   List<Member> members = new ArrayList<Member>();
//   {
//      members.add(new Member("javaman", "1234"));
//      members.add(new Member("test", "1234"));
//      members.add(new Member("asdf", "1234"));
//   }
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 폼 화면 : forwarding
		req.getRequestDispatcher("WEB-INF/jsp/member/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 처리
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String msg = "";
		String redirectUrl = "login";

		// 어떤타입의 변수로 두가지 경우를 처리할 수 있을까 >> boolean
		MemberService service = new MemberServiceImpl();
		boolean success = service.login(id, pwd);

		// 1. 아이디가 없다
		if (success) {
			HttpSession session = req.getSession();
			session.setAttribute("member", service.findBy(id));
			msg = "성공";

			// 아이디 저장
			Cookie cookie = new Cookie("savedId", id);
			cookie.setMaxAge(req.getParameter("savedId") == null ? 0 : 60 * 60 * 24 * 365); // 1년
			resp.addCookie(cookie);

			redirectUrl = "index.html";
		} else {
			msg = "로그인 실패";
		}

		resp.sendRedirect(redirectUrl + "?msg=" + URLEncoder.encode(msg, "utf-8"));

	}
}
