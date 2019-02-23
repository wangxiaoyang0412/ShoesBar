package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 * Servlet implementation class SendMail
 */
@WebServlet("/SendMail")
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.setProperty("java.net.preferIPv4Stack" , "true");
		 System.setProperty("mail.smtp.auth" , "true");
		 request.setCharacterEncoding("UTF-8");
		  SimpleEmail email = new SimpleEmail();
		  email.setHostName("smtp.163.com");
		  email.setAuthentication("chengong106@163.com", "68757575Gc");
		  String yanzheng=(String)request.getSession().getAttribute("verification_code");
		  try {   
		   email.setCharset("UTF-8");
		   email.addCc("chengong106@163.com");
		   email.addTo(request.getParameter("email"));
	      
		   email.setFrom("chengong106@163.com");
		   email.setSubject("Sneaker Bar Verification");   
		   email.setMsg("Your verification code is "+yanzheng+", validate time is 180sec.");
		   email.setSmtpPort(994);
		   email.setSSL(true); // gmail需要设置SSL安全设置
		   email.send();
		   request.setAttribute("sendmail.message", "邮件发送成功！");   
		   System.out.print("success!");
		   PrintWriter out = response.getWriter();  
	       out.println("<html><body><h2>success! Please check your mailbox to get verification code</h2></body></html>");  
	       
	       out.close();
		  } catch (EmailException e) {    
		   e.printStackTrace();
		   System.out.print("failed!");
		   request.setAttribute("sendmail.message", "邮件发送不成功！");   
		  }
		 // request.getRequestDispatcher("/sendResult.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
