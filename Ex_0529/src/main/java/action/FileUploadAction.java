package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUploadAction
 */
@WebServlet("/upload.do")
public class FileUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 매핑이 호출되면 가장먼저 실행되는 메서드
				System.out.println("서블릿접속됨");
				
				//post로 보냈다면 깨지지 않게 하기위해 인코딩을 해주자.
				request.setCharacterEncoding("utf-8");
				
				//파일업로드( multipart/form-data)
				String path = "/upload2/";
				
				//현재 프로젝트에 대한 정보를 관리하는 클래스
				ServletContext application = request.getServletContext();
				
				String real_path = application.getRealPath(path);
				System.out.println(real_path);
				
				int max_size = 1024*1024*100; //100mb
				
				//파일을 포함한 파라미터를 수신하기 위한 객체
				MultipartRequest mr = new MultipartRequest(request, //request정보를 위임
									   real_path, //업로드 경로
									   max_size,//최대 업로드 용량
									   "utf-8", //수신시 인코딩 타입
									   new DefaultFileRenamePolicy()// 중복된 파일명을 알아서 변경 같은 이름의 다른 사진을 올리게 되면 갱신되버린다.
									   );
				
				
				String filename = "no_file";
				
				//업로드가 완료된 파일의 정보를 얻어오자
				File f = mr.getFile("photo");
				
				if(f != null) {
					filename = f.getName();//방금 업로드된 파일의 이름을 가져올 수 있다.
				}
				
				//파일 이외의 일반 파라미터
				String title = mr.getParameter("title");
				
				//파일명과 제목을 request영역에 저장
				request.setAttribute("title", title);
				request.setAttribute("filename", filename);
				
				//바인딩해놓은 정보를 어떤 페이지에서 가져다가 사용할 것인지를 지정(포워딩)		
				RequestDispatcher disp = request.getRequestDispatcher("result.jsp");
				disp.forward(request,response);
		
		
	}

}









