package servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Coupon;
import util.Factory;

import com.jspsmart.upload.*;
import com.jspsmart.upload.File;
/**
 * Servlet implementation class CouponInsert
 */
@WebServlet("/CouponInsert")
public class CouponInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String filePath = "D:\\JavaProjects\\dbmanagement\\WebContent\\upload";
        //实例化上传组件
        SmartUpload su = new SmartUpload();
        su.setCharset("UTF-8");
        //初始化SmartUpload
        su.initialize(this.getServletConfig(), request, response);
        //设置上传文件对象10M
        su.setMaxFileSize(1024*1024*10);
        //设置所有文件大小100M
        su.setTotalMaxFileSize(1024*1024*100);
        //设置允许上传文件类型
        su.setAllowedFilesList("txt,jpg,gif,png");
        try {
            //设置禁止上传文件类型
            su.setDeniedFilesList("rar,jsp,js");
            //上传文件
            su.upload();
            //保存文件
            su.save(filePath);

        } catch (Exception e) {
            System.out.println("failed");
            e.printStackTrace();
        }
        String filename=su.getFiles().getFile(0).getFileName();
		Coupon coupon=new Coupon();
		coupon.setCoupon_id(su.getRequest().getParameter("coupon_id"));
		coupon.setSeller_id(su.getRequest().getParameter("seller_id"));
		coupon.setName(su.getRequest().getParameter("coupon_name"));
		coupon.setType(Integer.parseInt(su.getRequest().getParameter("coupon_type")));
		coupon.setDiscount_price(Float.parseFloat(su.getRequest().getParameter("discount_price")));
		coupon.setAmount(Integer.parseInt(su.getRequest().getParameter("amount")));
		coupon.setPic(filename);
		try {
			if(Factory.getIEmpDAOInstance().insert_Coupon(coupon)){
				PrintWriter out = response.getWriter();
				out.write("1");
		        out.flush();
		        out.close();
			}
			else{
				PrintWriter out = response.getWriter();
				out.write("2");
		        out.flush();
		        out.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
   // 上传准备
		/*
		*/
	}


