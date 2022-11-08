package portfolio;

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

public class admin_con_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LocalDateTime now = null;
	String pgnm, admmail, pointok, joinmn, joinlv, compnm, bossnm, reportnum, postnum, infomag, bsnum, bosstel, stbnum,
			post, infomail, bank, banknum, card, phone, voucher, minppt, maxppt, receiptok, divnm, divpay, divdate;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pr = response.getWriter();
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
		try {
			dbconnect db = new dbconnect();
			Connection con = db.dbcon2();

			String sql = "update page set pgnm=?, admmail=?, pointok=?, joinmn=?, joinlv=?,compnm=?,bossnm=?,reportnum=?,postnum=?,infomag=?"
					+ ",bsnum=?,bosstel=?,stbnum=?,post=?,infomail=?,bank=?,banknum=?,card=?,phone=?,voucher=?,minppt=?,maxppt=?,receiptok=?"
					+ ",shipnm=?,divpay=?,divdate=?,pdate=?  where bsnum=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, pgnm);
			ps.setString(2, admmail);
			ps.setString(3, pointok);
			ps.setString(4, joinmn);
			ps.setString(5, duty);
			ps.setString(6, compnm);
			ps.setString(7, bossnm);
			ps.setString(8, reportnum);
			ps.setString(9, postnum);
			ps.setString(10, infomag);
			ps.setString(11, bsnum);
			ps.setString(12, bosstel);
			ps.setString(13, stbnum);
			ps.setString(14, post);
			ps.setString(15, infomail);
			ps.setString(16, bank);
			ps.setString(17, banknum);
			ps.setString(18, card);
			ps.setString(19, phone);
			ps.setString(20, voucher);
			ps.setString(21, minppt);
			ps.setString(22, maxppt);
			ps.setString(23, receiptok);
			ps.setString(24, divnm);
			ps.setString(25, divpay);
			ps.setString(26, divdate);
			ps.setString(27, today);
			ps.setString(28, bsnum);
			int n = 0;
			System.out.println(ps);
			n = ps.executeUpdate();
			System.out.println(ps);
			if (n > 0) {
				System.out.println(n);
				pr.write("<script>alert('계정 정보가 수정되었습니다.'); location.href='./admin_config.jsp'</script>");
			} else {
				pr.write("<script>alert('등록 실패');history.go(-1);</script>");
			}
		} catch (Exception e) {

		}
	}
}
