package portfolio;

//페이지 환경설정
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class admin_con extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private PrintWriter pr = null;

	private LocalDateTime now = null;
	String pgnm, admmail, pointok, joinmn, joinlv, compnm, bossnm, reportnum, postnum, infomag, bsnum, bosstel, stbnum,
			post, infomail, bank, banknum, card, phone, voucher, minppt, maxppt, receiptok, divnm, divpay, divdate;

	public admin_con() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		this.pgnm = request.getParameter("pgnm");
		this.admmail = request.getParameter("admmail");
		this.pointok = request.getParameter("pointok");
		this.joinmn = request.getParameter("joinmn");
		this.joinlv = request.getParameter("joinlv");
		this.compnm = request.getParameter("compnm");
		this.bossnm = request.getParameter("bossnm");
		this.reportnum = request.getParameter("reportnum");
		this.postnum = request.getParameter("postnum");
		this.infomag = request.getParameter("infomag");
		this.bsnum = request.getParameter("bsnum");
		this.bosstel = request.getParameter("bosstel");
		this.stbnum = request.getParameter("stbnum");
		this.post = request.getParameter("post");
		this.infomail = request.getParameter("infomail");
		this.bank = request.getParameter("bank");
		this.banknum = request.getParameter("banknum");
		this.card = request.getParameter("card");
		this.phone = request.getParameter("phone");
		this.voucher = request.getParameter("voucher");
		this.minppt = request.getParameter("minppt");
		this.maxppt = request.getParameter("maxppt");
		this.receiptok = request.getParameter("receiptok");
		this.divnm = request.getParameter("divnm");
		this.divpay = request.getParameter("divpay");
		this.divdate = request.getParameter("divdate");
		this.now = LocalDateTime.now();
		if(stbnum==null&&reportnum==null) {
			stbnum="";
			reportnum="";
		}
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String today = this.now.format(df);
		int jolv = Integer.parseInt(this.joinlv);
		String duty = "";
		switch (jolv) {
		case 1:
			duty = "일반회원";
			break;
		case 2:
			duty = "실버회원";
			break;
		case 3:
			duty = "골드회원";
			break;
		case 4:
			duty = "VIP회원";
			break;
		case 5:
			duty = "사내직원";
			break;
		case 9:
			duty = "관리자";
			break;
		}
		String sql = "insert into page values('0','" + pgnm + "','" + admmail + "','" + pointok + "','" + joinmn + "','"
				+ duty + "','" + compnm + "','" + bossnm + "','" + reportnum + "','" + postnum + "','" + infomag + "','"
				+ bsnum + "','" + bosstel + "','" + stbnum + "','" + post + "','" + infomail + "','" + bank + "','"
				+ banknum + "','" + card + "','" + phone + "','" + voucher + "','" + minppt + "','" + maxppt + "','"
				+ receiptok + "','" + divnm + "','" + divpay + "','" + divdate + "','" + today + "')";

		try {
			dbconnect db = new dbconnect();
			Connection ct = db.dbcon2();
			PreparedStatement pr = ct.prepareStatement(sql);
			System.out.println(pr);
			int oksign = 0;
			oksign = pr.executeUpdate();
			response.setContentType("text/html;charset=utf-8");
			this.pr = response.getWriter();
			if (oksign > 0) {
				this.pr.write("<script>alert('올바르게 등록되었습니다.');  location.href='./admin_config.jsp'</script>");
				HttpSession session = request.getSession();
				session.setAttribute("bsnum", bsnum);
				
			} else {
				this.pr.write("<script>alert('등록 실패');history.go(-1);</script>");
			}
		} catch (Exception e) {
			System.out.println("error");
		}
	}

}
