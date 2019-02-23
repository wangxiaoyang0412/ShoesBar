package util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

import com.alibaba.fastjson.JSONObject;

import model.Shoes;
import model.Stock;

public class createdata {

	
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		/*
		Shoes shoe=new Shoes();
		Stock stock=new Stock();
		shoe.setShoes_id("undchg108-4325");
		shoe.setName("UnderArmour new running");
		shoe.setStyle("sports");
		shoe.setBrand("UnderArmour");
		shoe.setGender(1);
		shoe.setSeller_id("chg108");
		shoe.setPrice(32);
		stock.setSize("42");
		stock.setColor("white");
		stock.setAmount(12);
		if(Factory.getIEmpDAOInstance().create_shoesdata(shoe, stock)){
			System.out.print("ok");
		}
		*/
	
		
		for(int i=0;i<1000000;i++){
			Shoes shoe = data_ShoesRamdon();
			ArrayList<String> colorList=randomColor();
			try{
				Factory.getIEmpDAOInstance().create_shoesdata(shoe);
			}
			catch(Exception e){
			continue;
			}
			for(int j=0; j<6; j++){
			Stock stock = data_stockRamdon(colorList, shoe.getGender());
			//JSONObject json = (JSONObject)JSONObject.toJSON(stock);
		//System.out.println(json.toJSONString());
			try{
				Factory.getIEmpDAOInstance().create_stockdata(shoe, stock);
			}
			catch(Exception e){
				continue;
			}
			}
			//System.out.println("ok");
		}
		System.out.println("finish");
	}

	public static Shoes data_ShoesRamdon(){
		String [] brand={"Nike", "Adidas", "Puma", "UnderArmour", "NewBalance", "Asics","NorthFace", "Timberland","Columbia",
				"Fila", "Levis", "Converse", "Skechers", "Reebok", "Champion"};
		String [] style={"sports", "popular", "outdoor", "gym", "sandals", "casual"};
		
		
		String [] store_id={"chg106", "chg108", "chg111", "chg222", "chg333", "chg444", "chg555", "chg666", "chg777"};
		
		int [] gender={1, 2};
		
		String [] name={"new arrival", "most popular", "good sneaker", "durable", "best choice", "super discount", "long lasting",
				"today's deal", "good running", "outdoor great"};
		
		Shoes shoe=new Shoes();
		Random random = new Random();  
		int brand_num=random.nextInt(15);
		int style_num=random.nextInt(5);
		int store_id_num=random.nextInt(8);
		int name_num=random.nextInt(9);
		int gender_num=random.nextInt(2);
		shoe.setBrand(brand[brand_num]);
		shoe.setStyle(style[style_num]);
		shoe.setSeller_id(store_id[store_id_num]);
		shoe.setName(name[name_num]);
		shoe.setGender(gender[gender_num]);
		shoe.setShoes_id(shoesId(shoe.getSeller_id(), shoe.getBrand()));
		shoe.setPrice(shoesPrice());
		return shoe;
		
	}
	
	public static Stock data_stockRamdon(ArrayList<String> randomColor, int gender){
		String [] sizeWoman={"34", "35", "36", "37", "38", "39", "40", "41", "42", "43"};
		String [] sizeMan={"37", "38", "39", "40", "41", "41.5", "42", "42.5", "43", "43.5", "44", "44.5", "45", "46"};
		Stock stock = new Stock();
		int num = randomColor.size();
		Random  r = new Random();
		String color = randomColor.get(r.nextInt(num));
		stock.setColor(color);
		if(gender==1){
		stock.setSize(sizeMan[r.nextInt(14)]);}
		else{
			stock.setSize(sizeWoman[r.nextInt(10)]);
		}
		stock.setAmount(stockAmount());
	
		return stock;
	}
	
	public static ArrayList<String> randomColor(){
		String [] color={"black", "white", "red", "blue", "grey", "green", "yellow", "purple", "gold", "silver", "brown", "pink"};
		Random  r = new Random();
        ArrayList<String> list = new ArrayList<String>();
        int i=0;
        while(i < 3){
            int j = r.nextInt(12);
            if(!list.contains(color[j])){
                list.add(color[j]);
            }
            i++;
        }
		return list;
		
	}
	
	
	public static String shoesId(String store_id, String brand){
		String subBrand = brand.substring(0, 3)+store_id+"-";
		 int a= (int)((Math.random()*9+1)*10000);
		 String shoesId= subBrand+String.valueOf(a);
		return shoesId;
		
	}
	
	public static int stockAmount(){
		return (int)((Math.random()*100));
	}
	
	public static int shoesPrice(){
		//创建Random类对象
        Random random = new Random();                
        //产生随机数
        int price = random.nextInt(80) + 19; //19-99
        return price;
	}
}
