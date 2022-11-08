package portfolio;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
		fileSizeThreshold = 1024*1024*2,
		maxFileSize = 1024*1024*2,
		maxRequestSize =1024*1024*2
)
public class insert_cp extends HttpServlet {
	PrintWriter pw = null;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String path = request.getServletContext().getRealPath("");
	    String upload = path+"coupon/";
		String cname = request.getParameter("cname");
		String csort = request.getParameter("csort");
		String cstart = request.getParameter("cstart");
		String cend = request.getParameter("cend");
		String ctype = request.getParameter("ctype");
		String csale = request.getParameter("csale");
		String cminpay = request.getParameter("cminpay");
		Part cimg = request.getPart("cimg");
		cstart = cstart+" 00:00:00";
		cend = cend+" 23:59:59";
		String cenum = "N";
	
		try {
			dbconnect dbc = new dbconnect();
			Connection con = dbc.dbcon2();
			Date date = new Date();
			SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time2 = sf2.format(date);
			String fileName = cimg.getSubmittedFileName();	//첨부파일명
			if(fileName=="") {
				fileName=null;
			}else {
				cimg.write(upload+fileName);				
			}
			
			String sql = "insert into coupon values ('0',?,?,?,?,?,?,?,?,'"+time2+"'+'"+cenum+"')";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, cname);
			ps.setString(2, csort);
			ps.setString(3, cstart);
			ps.setString(4, cend);
			ps.setString(5, ctype);
			ps.setString(6, csale);
			ps.setString(7, cminpay);
			ps.setString(8, fileName);
			int a = 0;
			System.out.println(ps);
			a = ps.executeUpdate();

			this.pw = response.getWriter();
			System.out.println(a);
			if (a > 0) {
				pw.write("<script>alert('올바르게 등록되었습니다.'); location.href='./admin_shopping.jsp'</script>");
			} else {
				pw.write("<script>alert('등록 실패');history.go(-1);</script>");
			}

		} catch (Exception e) {

		}
	}

}
