package service;

import java.util.HashMap;
import java.util.List;

import model.Address;
import model.Brand_Buss;
import model.Cart;
import model.Cate_Num;
import model.Coupon;
import model.Orders;
import model.Regin_Num;
import model.Salesperson;
import model.Shoes;
import model.Stock;
import model.Store_Profit;
import model.User;

public class DB_OperationProxy implements DB_Operation{
	private Database_Connection dbc=null;
	private DB_Operation dao=null;
	public DB_OperationProxy()throws Exception{
		this.dbc=new Database_Connection();
		this.dao=new DB_OperationImpl(this.dbc.getConnection());
	}


	@Override
	public List<User> findAll3(String keyWord) throws Exception {
		List<User> all=null;
		try{
			all=this.dao.findAll3(keyWord);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public User findByld3(String uid) throws Exception {
		// TODO Auto-generated method stub
		User user=null;
		try{
			user=this.dao.findByld3(uid);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return user;
	}


	@Override
	public boolean loginValidate(String uid, String password) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			flag=this.dao.loginValidate(uid, password);
		}catch(Exception e){
			throw e;
		}
		finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public boolean Create_User(User user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			if(this.dao.findByld3(user.getUid())==null){
				flag=this.dao.Create_User(user);
			}
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public List<Shoes> findAll_Shoes(String keyWord) throws Exception {
		// TODO Auto-generated method stub
		List<Shoes> all=null;
		try{
			all=this.dao.findAll_Shoes(keyWord);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public Shoes findByShoesId(String shoes_id) throws Exception {
		// TODO Auto-generated method stub
		Shoes shoe=null;
		try{
			shoe=this.dao.findByShoesId(shoes_id);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return shoe;
	}


	@Override
	public HashMap<String, Integer> findShoes_Stock(String shoes_id, String seller_id) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer> stocks=new HashMap<String, Integer>();
		stocks=null;
		try{
			stocks=this.dao.findShoes_Stock(shoes_id, seller_id);
		}
		catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return stocks;
	}


	@Override
	public boolean cart_Insert(String uid, String shoes_id, String size, String color) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.cart_Insert(uid, shoes_id, size, color);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public List<Cart> findCartByUid(String uid) throws Exception {
		// TODO Auto-generated method stub
		List<Cart> all=null;
		try{
			all=this.dao.findCartByUid(uid);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public int findShoe_StockBySizeColor(String shoes_id, String size, String color) throws Exception {
		// TODO Auto-generated method stub
		int stocks=0;
		try{
			stocks=this.dao.findShoe_StockBySizeColor(shoes_id, size, color);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return stocks;
	}


	@Override
	public List<String> getStockColor(String shoes_id, String seller_id) throws Exception {
		// TODO Auto-generated method stub
		List<String> all=null;
		try{
			all=this.dao.getStockColor(shoes_id, seller_id);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public boolean order_Submit(Orders order) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.order_Submit(order);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public boolean delete_FromMyCart(String uid, String shoes_id, String size, String color) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.delete_FromMyCart(uid, shoes_id, size, color);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public List<Orders> find_MyOrders(String uid) throws Exception {
		// TODO Auto-generated method stub
		List<Orders> all=null;
		try{
			all=this.dao.find_MyOrders(uid);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public boolean address_Insert(Address address) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.address_Insert(address);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public List<Address> find_AllMyAddress(String uid) throws Exception {
		// TODO Auto-generated method stub
		List<Address> all=null;
		try{
			all=this.dao.find_AllMyAddress(uid);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public boolean address_Update(Address address) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.address_Update(address);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public int get_Address_num(String uid) throws Exception {
		// TODO Auto-generated method stub
		int address_num=0;
		try{
			address_num=this.dao.get_Address_num(uid);
	}catch(Exception e){
		throw e;
	}finally{
		this.dbc.close();
	}
		return address_num;
	}


	@Override
	public List<String> find_AllMyCoupon(String uid) throws Exception {
		// TODO Auto-generated method stub
		List<String> all=null;
		try{
			all=this.dao.find_AllMyCoupon(uid);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public Coupon find_CouponById(String coupon_id) throws Exception {
		// TODO Auto-generated method stub
		Coupon coupon=null;
		try{
			coupon=this.dao.find_CouponById(coupon_id);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return coupon;
	}


	@Override
	public List<Shoes> search_ShoesByKey(String[] keyWord) throws Exception {
		// TODO Auto-generated method stub
		List<Shoes> all=null;
		try{
			all=this.dao.search_ShoesByKey(keyWord);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public Orders find_OrderById(String oid) throws Exception {
		// TODO Auto-generated method stub
		Orders order=null;
		try{
			order=this.dao.find_OrderById(oid);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return order;
	}


	@Override
	public List<Shoes> search_ShoesByBrand(String brand) throws Exception {
		// TODO Auto-generated method stub
		List<Shoes> all=null;
		try{
			all=this.dao.search_ShoesByBrand(brand);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public boolean insert_Coupon(Coupon coupon) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.insert_Coupon(coupon);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public List<Coupon> show_AllCoupon() throws Exception {
		// TODO Auto-generated method stub
		List<Coupon> all=null;
		try{
			all=this.dao.show_AllCoupon();
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public boolean receive_Coupon(String uid, String coupon_id) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.receive_Coupon(uid, coupon_id);
		}catch(Exception e){
			return false;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public String sellerLoginValidate(String seller_id, String password) throws Exception {
		// TODO Auto-generated method stub
		String store_id=null;
		try{
			store_id=this.dao.sellerLoginValidate(seller_id, password);
		}catch(Exception e){
			throw e;
		}
		finally{
			this.dbc.close();
		}
		return store_id;
	}

	@Override
	public List<Orders> find_SellerOrders(String sellerid) throws Exception {
		// TODO Auto-generated method stub
		List<Orders> all=null;
		try{
			all=this.dao.find_SellerOrders(sellerid); //调用implement
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public boolean create_shoesdata(Shoes shoe) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.create_shoesdata(shoe);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public boolean create_stockdata(Shoes shoe, Stock stock) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.create_stockdata(shoe, stock);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public Salesperson Sale_info(String seller_id) throws Exception {
		// TODO Auto-generated method stub
		Salesperson seller=null;
		try{
			seller=this.dao.Sale_info(seller_id);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return seller;
	}


	@Override
	public boolean update_SellerOrders(String orderid) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			flag=this.dao.update_SellerOrders(orderid);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public boolean insert_homeUser(String uid, int gender, int age, float income, int marriage) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			flag=this.dao.insert_homeUser(uid, gender, age, income, marriage);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public boolean insert_BusyUser(String uid, String business_cat, String company) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
			flag=this.dao.insert_BusyUser(uid, business_cat, company);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public List<Shoes> search_ShoesAdvannced(String brand, String style, float[] price) throws Exception {
		// TODO Auto-generated method stub
		List<Shoes> all=null;
		try{
			all=this.dao.search_ShoesAdvannced(brand, style, price);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public HashMap<String, Float> system_todayBrandMoney() throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Float> stocks=new HashMap<String, Float>();
		stocks=null;
		try{
			stocks=this.dao.system_todayBrandMoney();
		}
		catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return stocks;
	}


	@Override
	public HashMap<String, Float> system_todayColorMoney() throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Float> stocks=new HashMap<String, Float>();
		stocks=null;
		try{
			stocks=this.dao.system_todayColorMoney();
		}
		catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return stocks;
	}
	
	@Override
	public List<Brand_Buss> get_Brand() throws Exception {
		// TODO Auto-generated method stub
		List<Brand_Buss> all=null;
		try{
			all=this.dao.get_Brand();
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public List<Cate_Num> get_Cate() throws Exception {
		// TODO Auto-generated method stub
		List<Cate_Num> all=null;
		try{
			all=this.dao.get_Cate();
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public List<Regin_Num> get_Regin() throws Exception {
		// TODO Auto-generated method stub
		List<Regin_Num> all=null;
		try{
			all=this.dao.get_Regin();
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public List<Store_Profit> get_Profit(String storeid) throws Exception {
		// TODO Auto-generated method stub
		List<Store_Profit> all=null;
		try{
			all=this.dao.get_Profit(storeid);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public List<Shoes> search_ShoesByStore(String store_id) throws Exception {
		// TODO Auto-generated method stub
		List<Shoes> all=null;
		try{
			all=this.dao.search_ShoesByStore(store_id);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}

	@Override
	public boolean insert_Shoes(Shoes shoe,int amount,String size, String color) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.insert_Shoes(shoe,amount,size,color);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}
	@Override
	public List<Shoes> findShoesByStore_id(String keyWord) throws Exception {
		// TODO Auto-generated method stub
		List<Shoes> all=null;
		try{
			all=this.dao.findShoesByStore_id(keyWord);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public List<Stock> findStockByStore_id(String store_id, String shoes_id) throws Exception {
		// TODO Auto-generated method stub
		List<Stock> all=null;
		try{
			all=this.dao.findStockByStore_id(store_id,shoes_id);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return all;
	}


	@Override
	public boolean delete_shoes(String shoes_id) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.delete_shoes(shoes_id);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public boolean update_shoes(String shoes_id, String store_id, int amount, String size, String color)
			throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.update_shoes(shoes_id,store_id,amount,size,color);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public boolean order_Return(String oid) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.order_Return(oid);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public boolean order_Confirm(String oid) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
				flag=this.dao.order_Confirm(oid);
		}catch(Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


	@Override
	public int[] system_Usernum() throws Exception {
		// TODO Auto-generated method stub
		int [] a={0,0,0,0};
		try{
			a=this.dao.system_Usernum();
	}catch(Exception e){
		throw e;
	}finally{
		this.dbc.close();
	}
		return a;
	}

}
