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


public class non_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json,charset=UTF-8");
		String mid = request.getParameter("mid");
		String menum = "N";
		PrintWriter pr = response.getWriter();
		try {
			dbconnect db = new dbconnect();
			Connection con = db.dbcon2();
			String ck_sql ="select menum from admin where mid=?";
			PreparedStatement ps = con.prepareStatement(ck_sql);
			ps.setString(1, mid);
			ResultSet rs = ps.executeQuery();
			String row = null;
			String result = null;	//ajax로 보내는 변수값
			
			while(rs.next()) {
				row = rs.getString("menum").intern();
			}
			 System.out.println(row);
			if(row=="N") {
				result="no";
				if(result=="no") {
					String delsql = "delete from admin where mid=? and menum='"+menum+"'";
					PreparedStatement ps2  =con.prepareStatement(delsql);
					ps2.setString(1, mid);
					ps2.executeUpdate();
					System.out.println(ps2);
				}
				
			}else {
				result="yes";
				
					
				
			}
			System.out.println(result);			
		}catch (Exception e) {
			e.getMessage();
		}
	}

	
}