package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.*;
import model.Shoes;
/**
 * Servlet implementation class SearchShoes
 */
@WebServlet("/SearchShoes")
public class SearchShoes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchShoes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("search").toString().equals(null)||request.getParameter("search").toString().equals("")){
			try {
				List<Shoes> all=Factory.getIEmpDAOInstance().findAll_Shoes("");
				request.setAttribute("shoes", all);
				request.getRequestDispatcher("./search_shoes.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
		else{
			String kw=request.getParameter("search").toString();
			String[] keyWord=StringUtil.get_KeyWords(kw);
			try {
				List<Shoes> all=Factory.getIEmpDAOInstance().search_ShoesByKey(keyWord);
				request.setAttribute("shoes", all);
				request.getRequestDispatcher("./search_shoes.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
         doGet(request,response);
	}

}
