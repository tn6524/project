package portfolio;

//카테고리 등록
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class insert_cate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pw = null;

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String BMcode = request.getParameter("BMcode");
		String BMname = request.getParameter("BMname");
		String SMcode = request.getParameter("SMcode");
		String SMname = request.getParameter("SMname");
		String cateok = request.getParameter("cateok");
		String code = request.getParameter("code");
		try {
			dbconnect dbc = new dbconnect();
			Connection con = dbc.dbcon2();
			Date date = new Date();
			SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time2 = sf2.format(date);

			String sql = "insert into cate (idx,code,BMcode,BMname,SMcode,SMname,cateok,indate) values ('0',?,?,?,?,?,?,'"
					+ time2 + "')";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, code);
			ps.setString(2, BMcode);
			ps.setString(3, BMname);
			ps.setString(4, SMcode);
			ps.setString(5, SMname);
			ps.setString(6, cateok);

			int a = 0;
			a = ps.executeUpdate();

			this.pw = response.getWriter();

			if (a > 0) {
 				pw.write("<script>alert('올바르게 등록되었습니다.'); location.href='./admin_category.jsp?codename=&&word='</script>");
			} else {
				pw.write("<script>alert('등록 실패');history.go(-1);</script>");
			}

		} catch (Exception e) {
			pw.write("<script>alert('등록 실패');history.go(-1);</script>");
		}

	}
}