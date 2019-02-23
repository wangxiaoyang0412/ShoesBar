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


public interface DB_Operation {
	/**
	user
	 */
	public List<User> findAll3(String keyWord)throws Exception;  //查询所有用户列表
	
	public User findByld3(String uid)throws Exception;		//根据用户ID查找唯一用户信息
	
	public boolean loginValidate(String uid, String password)throws Exception;   //验证用户登录信息
	
	public boolean Create_User(User user)throws Exception;		//添加新用户
	
	public String sellerLoginValidate(String seller_id, String password)throws Exception;
	
	public boolean insert_homeUser(String uid, int gender, int age, float income, int marriage)throws Exception; 
	
	public boolean insert_BusyUser(String uid, String business_cat, String company)throws Exception; 
	
	/**
	sale
	 */
	public Salesperson Sale_info(String keyWord)throws Exception; //查询用户信息
	
	/**
	shoes
	 */
	public List<Shoes> findAll_Shoes(String keyWord)throws Exception;  //find all shoes list
	
	public Shoes findByShoesId(String shoes_id)throws Exception;	//find a shoes by shoes_id
	
	public List<Shoes> search_ShoesByKey(String[] keyWord)throws Exception;  //find shoes by key words
	
	public List<Shoes> search_ShoesByBrand(String brand)throws Exception;	//find a shoes by brand
	
	public List<Shoes> search_ShoesAdvannced(String brand, String style, float[] price)throws Exception;	//advanced find a shoes by all sort
	
	public List<Shoes> search_ShoesByStore(String store_id)throws Exception;	//find a shoes by brand
	/**
	stock
	 */
	public HashMap<String, Integer> findShoes_Stock(String shoes_id, String seller_id)throws Exception;  //find stocks of one shoes(size,amount)

	public int findShoe_StockBySizeColor(String shoes_id,String size, String color)throws Exception;  //find stocks of one shoes of one size
	
	public List<String> getStockColor(String shoes_id, String seller_id)throws Exception; //get stocks of one color of one shoes
	/**
	cart
	 */
	public boolean cart_Insert(String uid, String shoes_id, String size, String color)throws Exception;	//user insert products to cart
	
	public List<Cart> findCartByUid(String uid)throws Exception;	//find users cart information
	
	public boolean delete_FromMyCart(String uid, String shoes_id, String size, String color)throws Exception; //delete one item from cart
	
	/**
	orders
	 */
	public boolean order_Submit(Orders order)throws Exception; //submit order
	
	public List<Orders> find_MyOrders(String uid)throws Exception;  //List all of my orders
	
	public Orders find_OrderById(String oid)throws Exception;	//find order information by order_id
	
	public boolean order_Return(String oid)throws Exception;
	
	public boolean order_Confirm(String oid)throws Exception;
	
	/**
	SELLER orders
	 */
	public List<Orders> find_SellerOrders(String sellerid)throws Exception;  //List all of my orders
	
	public boolean update_SellerOrders(String orderid)throws Exception;  
	
	
	/**
	 Address
	 */
	public boolean address_Insert(Address address)throws Exception;  //insert a new mailing address for a user
	
	public boolean address_Update(Address address)throws Exception;  //update a mailing address for a user
	
	public List<Address> find_AllMyAddress(String uid)throws Exception;  //find all of the users' address
	
	public int get_Address_num(String uid)throws Exception;  //get address_num
	
	/**
	 Coupon-User
	 */
	//public boolean receive_Coupon(String uid, String coupon_id)throws Exception;  //receive a coupon for a user
	
	//public int left_CouponAmount(String coupon_id)throws Exception;  //get the left amount of one coupon
	
	public List<String> find_AllMyCoupon(String uid)throws Exception;  //get all received coupon
	
	public Coupon find_CouponById(String coupon_id)throws Exception;	//find a coupon by coupon_id
	
	public boolean insert_Coupon(Coupon coupon)throws Exception;      //insert new coupon
	
	public List<Coupon> show_AllCoupon()throws Exception;  //show all coupon which could be received
	
	public boolean receive_Coupon(String uid, String coupon_id)throws Exception; //user get a coupon

	
	/**
	 * Create Data
	 */
	public boolean create_shoesdata(Shoes shoe)throws Exception;
	
	public boolean create_stockdata(Shoes shoe, Stock stock)throws Exception;
	
	/**
	 *  system statistic
	 */
	public HashMap<String ,Float> system_todayBrandMoney()throws Exception;  //today order by brand
	
	public HashMap<String ,Float> system_todayColorMoney()throws Exception; //today order by color
	
	public int [] system_Usernum()throws Exception;
	
	/**
	 * Order_Aggregation
	 */
	public List<Brand_Buss> get_Brand()throws Exception;
	public List<Cate_Num> get_Cate()throws Exception;
	public List<Regin_Num> get_Regin()throws Exception;
	public List<Store_Profit> get_Profit(String storeid)throws Exception;

public boolean insert_Shoes(Shoes shoe, int amount, String size, String color)throws Exception;   //insert shoes by key words
	
	public List<Shoes> findShoesByStore_id(String keyword) throws Exception;
	
	public boolean delete_shoes(String shoes_id) throws Exception;//delete shoes by shoe_id
	
	public boolean update_shoes(String shoes_id,String store_id, int amount, String size, String color)throws Exception;

	public List<Stock> findStockByStore_id(String store_id, String shoes_id) throws Exception;

}
