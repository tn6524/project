package portfolio;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class del_notice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
        PrintWriter pw = response.getWriter();
        String idx =request.getParameter("idx");
        dbconnect dbc = null;
        Connection c = null;
        try {
        	dbc = new dbconnect();
        	c= dbc.dbcon2();
        	String sql = "delete from notice where nidx=?";
        	PreparedStatement ps = c.prepareStatement(sql);
        	ps.setString(1, idx);
        	int n = 0;
        	n=ps.executeUpdate();
        	if(n>0) {
        		pw.write("<script>alert('정상적으로 삭제되었습니다.'); location.href='./admin_notice.jsp'</script>");
        	}else {
        		pw.write("<script>alert('삭제 실패');history.go(-1);</script>");
        	}
        }catch (Exception e) {

		}
	}

}
