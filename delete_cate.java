package portfolio;
//카테고리 삭제
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class delete_cate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		dbconnect dbc = null;
		Connection c = null;
		String[] chk = request.getParameterValues("chk");
		for(int i =0; i<chk.length; i++) {
			
		}
		String cont = request.getParameter("cont");
		int ctn = Integer.parseInt(cont);
		try {
			dbc = new dbconnect();
			c = dbc.dbcon2();
			int t=1;
				while(t<ctn+1) {
				for(int i =0; i<chk.length; i++) {
				String sql2 = "delete from cate where idx=?";
				PreparedStatement ps2 = c.prepareStatement(sql2);
				ps2.setString(t, chk[i]);	
				int a = 0;
				a = ps2.executeUpdate();
				if (a > 0) {
					pw.write("<script>alert('정상적으로 삭제되었습니다.'); location.href='./admin_category.jsp?codename=&&word='</script>");

				} else {
					pw.write("<script>alert('삭제 실패');history.go(-1);</script>");
				}
				
				
			} 
			}
				} catch (Exception e) {

		}
	}

}
