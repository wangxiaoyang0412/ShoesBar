package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Factory;

/**
 * Servlet implementation class LoginValidate
 */
@WebServlet("/LoginValidate")
public class LoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginValidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userType=request.getParameter("usertype");
		if(userType.equals("customer")){
		try {
			if(Factory.getIEmpDAOInstance().loginValidate(request.getParameter("username"), request.getParameter("password"))){
				HttpSession session=request.getSession();
				session.setAttribute("uid", request.getParameter("username"));
				response.sendRedirect("./home.jsp");
			}
			else{
				 PrintWriter out = response.getWriter();
				 out.write("<html><body><h3>Password or Username wrong!  please wait to jump login page,...</h3></body></html>");
				 response.setHeader("refresh", "2;url=./login.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 request.getRequestDispatcher("./error.jsp").forward(request, response);
		}
		}
		else{
			try {
				String store_id=Factory.getIEmpDAOInstance().sellerLoginValidate(request.getParameter("username"), request.getParameter("password"));
				if(store_id!=null){
					HttpSession session=request.getSession();
					session.setAttribute("sellerid", request.getParameter("username"));
					session.setAttribute("storeid", store_id);
					response.sendRedirect("./sellerhome.jsp");
				}
				else{
					 PrintWriter out = response.getWriter();
					 out.write("<html><body><h3>Password or Username wrong!  please wait to jump login page,...</h3></body></html>");
					 response.setHeader("refresh", "2;url=./login.jsp");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				 request.getRequestDispatcher("./error.jsp").forward(request, response);
			}
		}
		
	}

}
