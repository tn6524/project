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

public class up_notice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pr = response.getWriter();
		String nidx =request.getParameter("nidx");
		String nch = request.getParameter("nch");
		String path = request.getServletContext().getRealPath("");
	    String upload = path+"notice/";
		if(nch==null||nch=="N"||nch=="0") {
			nch="N";
		}else {
			nch="Y";
		}
		Part nfile = request.getPart("nfile");

        String fileName =  nfile.getSubmittedFileName();	//첨부파일명
        
        nfile.write(upload+fileName);
		String ntitle = request.getParameter("ntitle");
		System.out.println(ntitle);
		String nnotice = request.getParameter("nnotice");
		System.out.println(nnotice);
		Date date = new Date();
		SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time2 = sf2.format(date);
		
		try {
        	dbconnect db= new dbconnect();
        	Connection con = db.dbcon2();
        	String sql = "update notice set nch=?, ntitle=?,nfile=?, nnotice=?, indate=? where nidx=?";
        			PreparedStatement ps  =con.prepareStatement(sql);
        			System.out.println(ps);
        			ps.setString(1, nch);
        			ps.setString(2, ntitle);
        			ps.setString(3, fileName);
        			ps.setString(4, nnotice);
        			ps.setString(5, time2);
        			ps.setString(6, nidx);
        			
        			int n= 0;
        		    n=ps.executeUpdate();

        		    if(n>0){
        		    	System.out.println(n);
        		    	pr.write("<script>alert('공지사항이 수정되었습니다.'); location.href='./admin_notice.jsp'</script>");
        		    }else{
        		    	pr.write("<script>alert('수정 실패');history.go(-1);</script>");
        		    }
        			
        }catch (Exception e) {
        	
		}
	}

}
