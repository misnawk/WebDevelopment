package action;

import java.io.IOException;
import java.util.List;

import dao.BoardDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.BoardVO;

@WebServlet("/view")
public class BoardViewAction extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//넘어온 데이터를 가지고 계시글 한건을 조회하여 
		//voard_view.jsp로 포워딩하고 출력
		//전체 목록 가져오기
		
		int idx=Integer.parseInt(request.getParameter("idx")) ;
		BoardVO vo = BoardDAO.getInstance().selectOne(idx);
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);
			
		
		
//		RequestDispatcher disp = request.getRequestDispatcher("insert_form.jsp");
//		disp.forward(request, response);
	
		
	}
	
	
}
