package portfolio;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class del_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public del_admin() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter pw = response.getWriter();
        String mid =request.getParameter("mid");
        dbconnect dbc = null;
        Connection c = null;
        System.out.println(mid);
        try {
        	dbc = new dbconnect();
        	c= dbc.dbcon2();
        	String sql = "delete from admin where mid=?";
        	PreparedStatement ps = c.prepareStatement(sql);
        	ps.setString(1, mid);
        	int n = 0;
        	n=ps.executeUpdate();
        	System.out.println(ps);
        	
        	if(n>0) {
        		pw.write("<script>alert('정상적으로 삭제되었습니다.'); location.href='./admin_main.jsp'</script>");
        		
        	}else {
        		pw.write("<script>alert('삭제 실패');history.go(-1);</script>");
        	}
        }catch (Exception e) {

		}
	}



}
