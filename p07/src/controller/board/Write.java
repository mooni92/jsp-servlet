package controller.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import service.BoardServiceImpl;
import util.MyFileRenamePolicy;
import vo.Attach;
import vo.Board;
import vo.Member;

@WebServlet("/board/write")
public class Write extends HttpServlet {

	// 글쓰기 폼
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/board/write.jsp").forward(req, resp);
	}

	// 글쓰기 후 프로세스
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDirectory = "C:\\upload";
		String path = getPath();

		File uploadPath = new File(saveDirectory + File.separator + path);
		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		int maxPostSize = 10 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new MyFileRenamePolicy();
		MultipartRequest multi = new MultipartRequest(req, uploadPath.getAbsolutePath(), maxPostSize, encoding, policy);

		Enumeration<String> files = multi.getFileNames();
		List<Attach> attachs = new ArrayList<>();
		while (files.hasMoreElements()) {
			String file = files.nextElement();
			String uuid = multi.getFilesystemName(file);
			if (uuid == null)
				continue;
			String origin = multi.getOriginalFileName(file);

			Attach attach = new Attach(uuid, origin, null, path);
			attachs.add(attach);
		}
//      attachs.forEach(System.out::println);

		String title = multi.getParameter("title"); //
		String content = multi.getParameter("content"); //
		String id = ((Member) req.getSession().getAttribute("member")).getId();

		Board board = new Board(title, content, id, 1L);
		board.setAttachs(attachs);

		new BoardServiceImpl().write(board);

		resp.sendRedirect("list");
	}

	private String getPath() {
		return new SimpleDateFormat("yyMMdd").format(new Date());
	}

}