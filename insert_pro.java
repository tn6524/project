package portfolio;
//상품 등록
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
		fileSizeThreshold = 1024*1024*10,
		maxFileSize = 1024*1024*2,
		maxRequestSize =1024*1024*10
)
public class insert_pro extends HttpServlet {
	private static final long serialVersionUID = 1L;
      	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    
	   
	    String path = request.getServletContext().getRealPath("");
	    String upload = path+"product/";
	    
//	    System.out.println(upload); //웹경로
	    
	    

	    
	    try {
	    	
	    	
		    String BMcate =request.getParameter("BMcate");
	    String SMcode =request.getParameter("SMcate");
	    String code =request.getParameter("code");
	    String proname =request.getParameter("proname");
	    String plusinfo =request.getParameter("plusinfo");
		    String payment =request.getParameter("payment");
	    String sale =request.getParameter("sale");
		    int paysale1 =(int) (Integer.parseInt(payment)- (int) (Integer.parseInt(payment)*(Integer.parseInt(sale)*0.01)));
		    int paysale = Math.round(paysale1);	
		    String save_pro =request.getParameter("save_pro");
		    String sellok =request.getParameter("sellok");
	    String soldout =request.getParameter("soldout");
		    String info =request.getParameter("info");
		    Date date = new Date();
		    SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String time2 = sf2.format(date);
		    String image1 ="";
		    String image2 ="";
		    String image3 ="";
		    if(save_pro=="0") {
	        	sellok="N";
        }
		    if(info=="") {
		    	info=null;
		    }
		    System.out.println(proname);
	    	dbconnect dbc = new dbconnect();	
	    	Connection con = dbc.dbcon2();	
	    	String sql = "insert into pro (idx,BMcate,SMcode,code,proname,plusinfo,payment,sale,paysale,save_pro,sellok,soldout,image1,image2,image3,info,indate)";
	    	sql += " values ('0',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'"+time2+"')";
   	PreparedStatement ps = con.prepareStatement(sql);
	    	Collection<Part> p = request.getParts();

	    	Date date1 = new Date();
	    	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddhhmmss");
	    	String time =sf.format(date1);
	    	
	    	
	    	for(Part part: p) {
	        	String fileName =  part.getSubmittedFileName();	//첨부파일명
	        	String names = part.getName();
	        	String imgurl="";
	        	
	        	if(fileName!=null && !fileName.equals("")) {	//null첨부파일 없애기        		
	        		imgurl="../product/"+time+fileName;
	        		part.write(upload+time+fileName);
	        	}else {
	        		imgurl="";
	        	}

	        	
	        	switch (names) {
					case "image1":
					image1=imgurl;
					break;
					case "image2":
					image2 = imgurl;
					break;
					case "image3":
					image3 = imgurl;
					break;
				}
	        }
	      
	        ps.setString(1,BMcate);
	        ps.setString(2,SMcode);
	        ps.setString(3,code);
	        ps.setString(4,proname);
	        ps.setString(5,plusinfo);
	        ps.setString(6, payment);
	        ps.setString(7, sale);
	        ps.setInt(8, paysale);
	        ps.setString(9, save_pro);
      
	        ps.setString(10, sellok);
       
	        ps.setString(11,soldout);        
	        ps.setString(12,image1);
	        ps.setString(13,image2);
	        ps.setString(14,image3);
	        ps.setString(15,info);
	        
	        System.out.println(ps);
	        int a=0;
	        a = ps.executeUpdate();
	        System.out.println(a);
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter pw = response.getWriter();
	        if(a>0){
	        	pw.write("<script>alert('올바르게 등록되었습니다.'); location.href='./admin_product.jsp?codename=&&word='</script>");
	        	
	        }
	        else{	
	        	pw.write("<script>alert('등록 실패');history.go(-1);</script>");
	        }
	    	
	    }catch (Exception e) {

		}
	}

}
