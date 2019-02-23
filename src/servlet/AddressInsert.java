package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Address;
import util.Factory;
import util.Format;/**
 * Servlet implementation class AddressInsert
 */
@WebServlet("/AddressInsert")
public class AddressInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //update address information
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Address address=new Address();
		address.setUid(request.getParameter("uid").toString());
		address.setState(request.getParameter("state").toString());
		address.setCity(request.getParameter("city").toString());
		address.setStreet(request.getParameter("street").toString());
		address.setName(request.getParameter("name").toString());
		address.setPhone(request.getParameter("phone").toString());
		address.setZip_code(request.getParameter("zipcode").toString());
		address.setAddress_num(Integer.parseInt(request.getParameter("num").toString()));
		try {
			Factory.getIEmpDAOInstance().address_Update(address);
			response.sendRedirect("./my_information.jsp");
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
		Address address=new Address();
		address.setUid(request.getParameter("uid2").toString());
		address.setState(request.getParameter("state2").toString());
		address.setCity(request.getParameter("city2").toString());
		address.setStreet(request.getParameter("street2").toString());
		address.setName(request.getParameter("name2").toString());
		address.setPhone(request.getParameter("phone2").toString());
		address.setZip_code(request.getParameter("zipcode2").toString());
		try {
			address.setAddress_num(Format.generateAddress_num(request.getParameter("uid2").toString()));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			Factory.getIEmpDAOInstance().address_Insert(address);
			response.sendRedirect("./my_information.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("./error.jsp");
		}
	}

}
