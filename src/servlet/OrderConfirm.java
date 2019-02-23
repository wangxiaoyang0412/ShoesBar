package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Orders;
import model.Shoes;
import util.*;
/**
 * Servlet implementation class OrderConfirm
 */
@WebServlet("/OrderConfirm")
public class OrderConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderConfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Orders order=new Orders();
		try {
		order.setOrder_id(Format.getOrderId());
		order.setShoes_id(request.getParameter("shoes_id"));
		order.setUid(request.getParameter("uid"));
		order.setTime(Format.getNowTime1());
		Shoes shoe=Factory.getIEmpDAOInstance().findByShoesId(request.getParameter("shoes_id"));
		order.setUnit_price(shoe.getPrice());
		order.setTotal_price(shoe.getPrice());
		order.setItem_amount(1);
		order.setCoupon_id("000");
		order.setStatus(4);
		order.setSeller_id(shoe.getSeller_id());
		order.setSize(request.getParameter("size"));
		order.setColor(request.getParameter("color"));
		request.setAttribute("orders1", order);
		request.setAttribute("number", "2");
		request.setAttribute("totmoney", shoe.getPrice());
		request.getRequestDispatcher("./order_submit.jsp").forward(request, response);
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
		String[] lines = request.getParameterValues("ch");
		String[] shows_ids = request.getParameterValues("shoes_id");
		String[] size = request.getParameterValues("size");
		String[] color = request.getParameterValues("color");
		String[] oneprice = request.getParameterValues("oneprice");
		String[] amount = request.getParameterValues("num");
		String[] seller_id = request.getParameterValues("seller_id");
		Integer i=1;
		for(int line=0;line<lines.length;line++){
			int now_column=Integer.valueOf(lines[line]);
			Orders order=new Orders();
			order.setOrder_id(Format.getOrderId());
			order.setShoes_id(shows_ids[now_column]);
			order.setUid(request.getParameter("uid"));
			order.setTime(Format.getNowTime1());
			order.setUnit_price(Float.valueOf(oneprice[now_column]));
			order.setTotal_price(Float.valueOf(oneprice[now_column])*Integer.valueOf(amount[now_column]));
			order.setItem_amount(Integer.valueOf(amount[now_column]));
			order.setCoupon_id("000");
			order.setStatus(1);
			order.setSeller_id(seller_id[now_column]);
			order.setSize(size[now_column]);
			order.setColor(color[now_column]);
			request.setAttribute("orders"+i.toString(), order);
			/*try {
				if(Factory.getIEmpDAOInstance().order_Submit(order)){
					System.out.println("ok");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			*/
			i++;
		}
		System.out.print(Float.valueOf(request.getParameter("totprice")));
		request.setAttribute("totmoney", Float.valueOf(request.getParameter("totprice")));
		request.setAttribute("number", i.toString());
		 request.getRequestDispatcher("./order_submit.jsp").forward(request, response);
	}

}
