package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Factory;
import model.User;

/**
 * Servlet implementation class HelloWordServlet
 */
@WebServlet("/HelloWordServlet")
public class HelloWorldServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloWorldServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/* PrintWriter out = response.getWriter();  
	       out.println("<html>");  
	       out.println("<head><title>HELLO</title></head>");
	       out.println("<body");
	       out.println("<h1>HELLO WORLD i am gc haha</h1>");
	       out.println("</body>");
	       out.println(request.getParameter("a"));
	       out.println("</html>");
	       out.close();
	       */
		List<User> all;
		try {
			all = Factory.getIEmpDAOInstance().findAll3("123");
			request.setAttribute("user", all);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			User user=new User();
			user.setUid("chg");
			request.setAttribute("user", user);
			request.setAttribute("user11", 2);
	       request.getRequestDispatcher("./nihao.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
