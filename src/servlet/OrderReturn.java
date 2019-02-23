package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Factory;

/**
 * Servlet implementation class OrderReturn
 */
@WebServlet("/OrderReturn")
public class OrderReturn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderReturn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String order_id=request.getParameter("order_id");
		String cmd=request.getParameter("cmd");
		System.out.println(cmd);
		
		try {
			if(cmd.equals("return")){
			Factory.getIEmpDAOInstance().order_Return(order_id);
			System.out.println("returned");
			PrintWriter out = response.getWriter();
            out.write("success");
            out.flush();
            out.close();}
			if(cmd.equals("confirm")){
				Factory.getIEmpDAOInstance().order_Confirm(order_id);
				System.out.println("confirmws");
				PrintWriter out = response.getWriter();
	            out.write("success");
	            out.flush();
	            out.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
