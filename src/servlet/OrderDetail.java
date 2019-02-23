package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import util.Factory;
import model.Orders;
import model.Shoes;
/**
 * Servlet implementation class OrderDetail
 */
@WebServlet("/OrderDetail")
public class OrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Orders order=Factory.getIEmpDAOInstance().find_OrderById(request.getParameter("order_id").toString());
			String shoes_id=order.getShoes_id();
			Shoes shoe=Factory.getIEmpDAOInstance().findByShoesId(shoes_id);
			String json= JSON.toJSONString(order);
			JSONObject jsonobj=JSON.parseObject(json);
			jsonobj.put("shoes_name", shoe.getName());
			jsonobj.put("shoes_brand", shoe.getBrand());
			String json_res=jsonobj.toJSONString();
			PrintWriter out = response.getWriter();
            //或:ServletOutputStream out = response.getOutputStream();
            //但两个不要一起用!
            out.write(json_res);
            out.flush();
            out.close();
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
