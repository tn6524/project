package portfolio;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class service extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
        PrintWriter pw = response.getWriter();
        pw.write("<script>alert('서비스준비중입니다.'); location.href=history.go(-1)</script>");
}
}
