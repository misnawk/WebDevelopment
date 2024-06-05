package action;

import java.io.IOException;

import dao.BoardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.BoardVO;

@WebServlet("/insert.do") 
public class Insert extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		String name =  request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();
		
		BoardVO vo = new BoardVO();
		
		//번호 nextVal
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		//등록날짜 sysdate
		//조회수 0
		//ref currval
		//step 0
		//depth 0
		
		
		

		int res = BoardDAO.getInstance().insert(vo);
		
		if(res>0) {
			response.sendRedirect("board_list");
		}
		
		
		
		
	
	}
}
