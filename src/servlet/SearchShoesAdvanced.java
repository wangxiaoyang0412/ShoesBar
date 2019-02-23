package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Shoes;
import util.Factory;

/**
 * Servlet implementation class SearchShoesAdvanced
 */
@WebServlet("/SearchShoesAdvanced")
public class SearchShoesAdvanced extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchShoesAdvanced() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*HttpSession session = request.getSession();
		String brand= session.getAttribute("brand").toString();
		System.out.print(brand);
		*/
		PrintWriter out = response.getWriter();
		out.write("111");
		/*try {
			List<Shoes> shoes= Factory.getIEmpDAOInstance().search_ShoesByBrand(brand);
			PrintWriter out = response.getWriter();
	        out.write("<html><body><div class=\"container\" id=\"mainContent\"><div class=\"row-fluid\"><h2>Shoes Bar</h2>"
	        		+ "<% List<Shoes> all = Factory.getIEmpDAOInstance().search_ShoesByBrand(brand);Iterator<Shoes> iter=all.iterator();while(iter.hasNext()){Shoes shoe=iter.next();%>"
	        		+ "<div class=\"col-lg-4\" style=\"margin-top:30px\"><p><%=shoe.getBrand() %>&nbsp;&nbsp;&nbsp;&nbsp;<%=shoe.getName() %></p>"
	        		+ "<div class=\"card\" style=\"width:300px;\"><img class=\"card-img-top\" src=\"https://static.runoob.com/images/mix/img_avatar.png\" alt=\"Card image\" style=\"width:100%\">"
	        		+ "<div class=\"card-body\"><h4 class=\"card-title\">John Doe</h4><p class=\"card-text\">Some example text some example text. John Doe is an architect and engineer</p>"
	        		+ "<a href=\"./shoes_detail.jsp?shoes_id=<%=shoe.getShoes_id() %>\" class=\"btn btn-primary\">See Profile</a></div></div></div><%} %></div></div>"
	        		+ "</body></html>");
	        out.flush();
	        out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String brand=request.getParameter("brand");
		String style=request.getParameter("style");
		//String color=request.getParameter("color");
		String price=request.getParameter("price");
		float pri[]={0,0} ;
		if(price.equals("Under $30")){
			pri[0]=19;
			pri[1]=30;
		}
		else if(price.equals("$30-$50")){
			pri[0]=30;
			pri[1]=50;
		}
		else if(price.equals("$50-$70")){
			pri[0]=50;
			pri[1]=70;
		}
		else if(price.equals("$70-$90")){
			pri[0]=70;
			pri[1]=90;
		}
		else {
			pri[0]=90;
			pri[1]=100;
		}
		try{
			List<Shoes> all= Factory.getIEmpDAOInstance().search_ShoesAdvannced(brand, style, pri);
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
		}
	}

}
