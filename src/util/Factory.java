package util;


import java.util.List;

import model.Shoes;
import model.Stock;
import service.DB_Operation;
import service.DB_OperationProxy;
import service.JChartImpl;
import service.Jchart;


public class Factory {
	public static DB_Operation getIEmpDAOInstance()throws Exception{
		return new DB_OperationProxy();
	}
	
	public static Jchart ChartDisplay()throws Exception{
		return new JChartImpl();
	}
	
	public static void main(String[] args) throws Exception  
	{
		Factory.ChartDisplay().orderPricr_ByColor();
	}
}


