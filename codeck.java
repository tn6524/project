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


public class codeck extends HttpServlet {
	private static final long serialVersionUID = 1L;
      


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json,charset=UTF-8");
		String code = request.getParameter("code");
		PrintWriter pr = response.getWriter();
		try {
			dbconnect db = new dbconnect();
			Connection con = db.dbcon2();
			String ck_sql ="select count(*) as ctn from pro where code=?";
			PreparedStatement ps = con.prepareStatement(ck_sql);
			ps.setString(1, code);
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
