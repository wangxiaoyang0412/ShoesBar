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
 * Servlet implementation class CouponGet
 */
@WebServlet("/CouponGet")
public class CouponGet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponGet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String coupon_id=request.getParameter("coupon_id");
		HttpSession session=request.getSession();
		String uid=session.getAttribute("uid").toString();
		PrintWriter out = response.getWriter();
		try {
			if(Factory.getIEmpDAOInstance().receive_Coupon(uid, coupon_id))
			//response.sendRedirect("./cart.jsp");
			{
		            //或:ServletOutputStream out = response.getOutputStream();
		            //但两个不要一起用!
		            out.write("1");
		            out.flush();
		            out.close();
			}
			else{
            //或:ServletOutputStream out = response.getOutputStream();
            //但两个不要一起用!
            out.write("0");
            out.flush();
            out.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			 request.getRequestDispatcher("./error.jsp").forward(request, response);
            //e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
