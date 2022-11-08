package portfolio;
//관리자 등록
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class admin_sub extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PrintWriter pr = null;
    private LocalDateTime now = null;
    String mid,mpw,mname,mmail,mtel1,mtel2,mtel3,tel,mwkp,mwks;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
	this.mid = request.getParameter("mid");
	this.mpw = request.getParameter("mpw");
	this.mname = request.getParameter("mname");
	this.mmail = request.getParameter("mmail");
	this.mtel1 = request.getParameter("mtel1");
	this.mtel2 = request.getParameter("mtel2");
	this.mtel3 = request.getParameter("mtel3");
	this.tel =mtel1+mtel2+mtel3;
	this.mwkp = request.getParameter("mwkp");
	this.mwks = request.getParameter("mwks");
	this.now = LocalDateTime.now();
	String menum = "N";
	DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String today = this.now.format(df);
	String sql = "insert into admin values('0','"+mid+"','"+mpw+"','"+mname+"','"+mmail+"','"+tel+"','"+mwkp+"','"+mwks+"','"+today+"','"+menum+"')";	
	
	try {
		dbconnect db = new dbconnect();
		Connection ct = db.dbcon2();
		PreparedStatement pr = ct.prepareStatement(sql);
		System.out.println(pr);
	int oksign = 0;
	oksign = pr.executeUpdate();
	response.setContentType("text/html;charset=utf-8");
	this.pr=response.getWriter();
	if(oksign>0) {
		this.pr.write("<script>alert('정상적으로 등록되었습니다.'); location.href='./index.html'</script>");
	}else {
		this.pr.write("<script>alert('등록이 실패되었습니다.');history.go(-1);</script>");
	}
	}catch (Exception e) {
		
	}
}
	

}
