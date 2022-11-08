package portfolio;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class up_adm extends HttpServlet {
	 
	    
	    String mid,mpw,mname,mpwck,mmail,mtel1,mtel2,mtel3,tel,mwkp,mwks;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pr = response.getWriter();
		this.mid = request.getParameter("mid");
		this.mpw = request.getParameter("mpass");
		this.mpwck = request.getParameter("mpassck"); 
		this.mname = request.getParameter("mname");
		this.mmail = request.getParameter("memail");
		this.mtel1 = request.getParameter("tel1");
		this.mtel2 = request.getParameter("tel2");
		this.mtel3 = request.getParameter("tel3");
		this.tel =mtel1+mtel2+mtel3;
		this.mwkp = request.getParameter("mwkp");
		this.mwks = request.getParameter("mwks");
		
		try {
        	dbconnect db= new dbconnect();
        	Connection con = db.dbcon2();
        	String sql = "update admin set mpass=?, mname=?, memail=?, mtel=?, mwkp=?,mwks=? where mid=?";
        			PreparedStatement ps  =con.prepareStatement(sql);
        			ps.setString(1, mpw);
        			ps.setString(2, mname);
        			ps.setString(3, mmail);
        			ps.setString(4, tel);
        			ps.setString(5, mwkp);
        			ps.setString(6, mwks);
        			ps.setString(7, mid);
        			int n= 0;
        		    n=ps.executeUpdate();
        		    System.out.println(ps);
        		    if(n>0){
        		    	System.out.println(n);
        		    	pr.write("<script>alert('계정 정보가 수정되었습니다.'); location.href='./admin_main.jsp'</script>");
        		    }else{
        		    	pr.write("<script>alert('등록 실패');history.go(-1);</script>");
        		    }
        			
        }catch (Exception e) {
        	
		}
	}

}
