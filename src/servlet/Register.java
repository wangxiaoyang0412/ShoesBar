package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import util.Factory;
/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
		try {
			User user1 = Factory.getIEmpDAOInstance().findByld3(request.getParameter("uid"));
			if(user1!=null)
			{ PrintWriter out = response.getWriter();
	         //或:ServletOutputStream out = response.getOutputStream();
	         //但两个不要一起用!
	         out.write("1");
	         out.flush();
	         out.close();
		}
			else{
				 PrintWriter out = response.getWriter();
		         //或:ServletOutputStream out = response.getOutputStream();
		         //但两个不要一起用!
		         out.write("2");
		         out.flush();
		         out.close();
			}
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user=new User();
		user.setUid(request.getParameter("uid"));
		user.setUname(request.getParameter("uname"));
		user.setUpassword(request.getParameter("upassword"));
		user.setUemail(request.getParameter("uemail"));
		user.setUphone(request.getParameter("uphone"));
		user.setKind(Integer.parseInt(request.getParameter("usertype").toString()));
		String uid=request.getParameter("uid");
		User user1;
		try {
			user1 = Factory.getIEmpDAOInstance().findByld3(uid);
			if(user1!=null)
			{System.out.println("user id exist1");
			response.sendRedirect("./error.html");
		}
			else{
			if(Factory.getIEmpDAOInstance().Create_User(user)){
				 PrintWriter out = response.getWriter();
				 Factory.getIEmpDAOInstance().insert_homeUser(uid, Integer.parseInt(request.getParameter("gender")), Integer.parseInt(request.getParameter("age")),Float.parseFloat(request.getParameter("income")), Integer.parseInt(request.getParameter("marriage")));
				 out.write("<html><body><h3>Register Success!  In 3 seconds will jump to login page, please wait...</h3></body></html>");
				 response.setHeader("refresh", "3;url=./login.jsp");
			}
			else response.setHeader("refresh", "2;URL=./error.jsp");
		} 
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
