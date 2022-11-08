package portfolio;

//공지사항
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
public class admin_write extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response )
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pr = response.getWriter();
		String path = request.getServletContext().getRealPath("");
	    String upload = path+"notice/";
		String nch = request.getParameter("nch");
		if(nch==null) {
			nch="N";
		}
		String ntitle = request.getParameter("ntitle");
		String nadminnm = request.getParameter("nadminnm");		
		String nnotice = request.getParameter("nnotice");
		
		Part nfile = request.getPart("nfile");

        String fileName =  nfile.getSubmittedFileName();	//첨부파일명
        
        nfile.write(upload+fileName);

		
		
		int ncount = 0;
		Date date = new Date();
		SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time2 = sf2.format(date);
		try {
			dbconnect db = new dbconnect();
			Connection con = db.dbcon2();
			String sql = "insert into notice values('0','"+nch+"','"+ntitle+"','"+nadminnm+"','"+fileName+"','"+nnotice+"','"+ncount+"','"+time2+"')";
	    	PreparedStatement ps = con.prepareStatement(sql);
	    
	    	int oksign = 0;
			oksign = ps.executeUpdate();
			response.setContentType("text/html;charset=utf-8");
			pr=response.getWriter();
			if(oksign>0) {
				pr.write("<script>alert('올바르게 등록되었습니다.'); location.href='./admin_notice.jsp?ntitle="+ntitle+"'</script>");
			}else {
				pr.write("<script>alert('등록 실패');history.go(-1);</script>");
			}
			}catch (Exception e) {
				
			}
		
			
		}
		
	
}
