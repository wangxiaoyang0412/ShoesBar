package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Orders;
import util.Factory;
import util.Format;


/**
 * Servlet implementation class OrderSubmit
 */
@WebServlet("/OrderSubmit")
public class OrderSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		int num=Integer.parseInt(session.getAttribute("num").toString());
		int i=1;
		while(i<=num){
			
				Orders order=(Orders)session.getAttribute("order"+String.valueOf(i));
				order.setTime(Format.getNowTime1());
				order.setCoupon_id(request.getParameter("coupon"));
				order.setTotal_price(order.getItem_amount()*order.getUnit_price());
				order.setAddress_num(Integer.parseInt(request.getParameter("address").toString()));
				try {
					Factory.getIEmpDAOInstance().order_Submit(order);
					Factory.getIEmpDAOInstance().delete_FromMyCart(request.getParameter("uid").toString(), order.getShoes_id(), order.getSize(), order.getColor());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					i++;
				}
		}
				response.sendRedirect("./my_order.jsp");
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//System.out.println(request.getParameter("num"));
		
	
	}

}
