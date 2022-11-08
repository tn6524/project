package portfolio;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class loginok extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		PrintWriter pr = response.getWriter();
		try {
			dbconnect db = new dbconnect();
			Connection con = db.dbcon2();
			
			String ck_sql ="select count(*) as ctn,mname,menum from admin where mid=? and mpass=?";
			PreparedStatement ps = con.prepareStatement(ck_sql);
			ps.setString(1, mid);
			ps.setString(2, mpw);
			ResultSet rs = ps.executeQuery();
			String row = null;
			String name = null;
			String menum = null;
			while(rs.next()) {
				row = rs.getString("ctn").intern();
				name = rs.getString("mname").intern();
				menum = rs.getString("menum").intern();
			}
			
			
			if(row!="0" && menum.equals("Y")) {
				pr.write("<script>alert('로그인 완료'); location.href='./admin_main.jsp?name"+name+"'</script>");
				HttpSession session = request.getSession();
				session.setAttribute("mname", name);
				session.setAttribute("mid", mid);
			}
						
			}catch (Exception e) {
				pr.write("<script>alert('계정정보를 확인해주세요'); history.go(-1);</script>");
				//System.out.println(e);
			}
		
		     
	       
	}

}

		

