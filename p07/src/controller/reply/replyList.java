package controller.reply;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.ReplyServiceImpl;
import vo.Reply;

@WebServlet("/reply/list")
public class replyList extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String b = req.getParameter("bno");
		if(b == null) {
			b= "1667897";
		}
		Long bno = Long.parseLong(b);
		List<Reply> replies = new ReplyServiceImpl().list(bno);
//		System.out.println(replies);
		
		Gson gson = new Gson();
		String json = gson.toJson(replies);
		
//		System.out.println(json);
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(json);
		
	}
	
}
