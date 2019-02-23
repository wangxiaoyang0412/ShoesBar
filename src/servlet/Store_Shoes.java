package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Shoes;
import util.Factory;

/**
 * Servlet implementation class Store_Shoes
 */
@WebServlet("/Store_Shoes")
public class Store_Shoes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Store_Shoes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			List<Shoes> all = Factory.getIEmpDAOInstance().search_ShoesByStore(request.getParameter("storeid"));
			if(all.size()!=0){
				request.setAttribute("shoes", all);
				request.getRequestDispatcher("./search_shoes.jsp").forward(request, response);}
				else{
					request.setAttribute("shoes", "no");
					request.getRequestDispatcher("./search_shoes.jsp").forward(request, response);
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.getRequestDispatcher("./error.jsp").forward(request, response);
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
