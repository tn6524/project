package portfolio;
//중복확인
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class check extends HttpServlet {
	PrintWriter pw = null;
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json,charset=UTF-8");
		String mid = request.getParameter("mid");
		PrintWriter pr = response.getWriter();
		try {
			dbconnect db = new dbconnect();
			Connection con = db.dbcon2();
			String ck_sql ="select count(*) as ctn from admin where mid=?";
			PreparedStatement ps = con.prepareStatement(ck_sql);
			ps.setString(1, mid);
			ResultSet rs = ps.executeQuery();
			String row = null;
			String result = null;	//ajax로 보내는 변수값
			while(rs.next()) {
				row = rs.getString("ctn").intern();
				
			}
			if(row!="0") {
				result="no";
			}else {
				result="yes";
			}
			pr.print(result);
		}catch (Exception e) {
			e.getMessage();
		}
	}
}
