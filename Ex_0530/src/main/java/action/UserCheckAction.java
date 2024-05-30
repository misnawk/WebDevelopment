package action;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.UserVO;

@WebServlet("/check_id.do")
public class UserCheckAction extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		
		UserVO vo = UserDAO.getInstance().selectOne(id);
		
		String res = "no";
		if(vo == null) {
			res = "yes";
		}
		
		String result = String.format("[{'res':'%s'}]", res);
		response.getWriter().print(result);
	}
}











