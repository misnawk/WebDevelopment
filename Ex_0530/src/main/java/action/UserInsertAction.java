package action;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.UserVO;

@WebServlet("/insert.do")
public class UserInsertAction extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setName(name);
		vo.setPwd(pwd);
		
		int res = UserDAO.getInstance().insert(vo);
		
		if(res == 1) {
			response.sendRedirect("user_list.do");
		}
	}
}











