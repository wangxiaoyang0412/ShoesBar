package service;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import model.Address;
import model.Brand_Buss;
import model.Cart;
import model.Cate_Num;
import model.Coupon;
import model.Coupon_Get;
import model.Orders;
import model.Regin_Num;
import model.Salesperson;
import model.Shoes;
import model.Stock;
import model.Store_Profit;
import model.User;
import util.Format;;



public class DB_OperationImpl implements DB_Operation{
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	public DB_OperationImpl(Connection conn){
		this.conn=conn;
	}
	@Override
	public List<User> findAll3(String keyWord) throws Exception {
		// TODO Auto-generated method stub
		List<User>all=new ArrayList<User>();
		String sql="SELECT uid,uname,upassword,uemail,uphone,ucity FROM user";
		this.pstmt=this.conn.prepareStatement(sql);
		ResultSet rs=this.pstmt.executeQuery();
		User user=null;
		while(rs.next()){
			user=new User();
			user.setUid(rs.getString(1));
			user.setUname(rs.getString(2));
			user.setUpassword(rs.getString(3));
			user.setUemail(rs.getString(4));
			user.setUphone(rs.getString(5));
			user.setUcity(rs.getString(6));
			all.add(user);
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public User findByld3(String uid) throws Exception {
		// TODO Auto-generated method stub
		User user=null;
		String sql="SELECT * FROM user WHERE uid=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, uid);
		ResultSet rs=this.pstmt.executeQuery();
		if(rs.next()){
			user=new User();
			user.setUid(rs.getString(1));
			user.setUname(rs.getString(2));
			user.setUpassword(rs.getString(3));
			user.setUemail(rs.getString(4));
			user.setUphone(rs.getString(5));
		}
		this.pstmt.close();
		return user;
	}
	@Override
	public boolean loginValidate(String uid, String password) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="SELECT uname FROM user WHERE uid=? AND upassword=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,uid);
		pstmt.setString(2,password);
		ResultSet rs=this.pstmt.executeQuery();
		if(rs.next()){
			 flag=true;
		}
		return flag;
	}
	@Override
	public boolean Create_User(User user) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="INSERT INTO user(uid,uname,upassword,uemail,uphone,kind)VALUES(?,?,?,?,?,?)";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, user.getUid());
		this.pstmt.setString(2, user.getUname());
		this.pstmt.setString(3, user.getUpassword());
		this.pstmt.setString(4, user.getUemail());
		this.pstmt.setString(5, user.getUphone());
		this.pstmt.setInt(6, user.getKind());
	
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public List<Shoes> findAll_Shoes(String keyWord) throws Exception {
		// TODO Auto-generated method stub
		List<Shoes>all=new ArrayList<Shoes>();
		String sql="SELECT * FROM show_shoes LIMIT 100";
		this.pstmt=this.conn.prepareStatement(sql);
		ResultSet rs=this.pstmt.executeQuery();
		Shoes shoe=null;
		while(rs.next()){
			shoe=new Shoes();
			shoe.setShoes_id(rs.getString(1));
			shoe.setName(rs.getString(2));
			shoe.setBrand(rs.getString(4));
			shoe.setStyle(rs.getString(3));
			shoe.setGender(rs.getInt(5));
			shoe.setPrice(rs.getFloat(6));
			shoe.setSeller_id(rs.getString(7));
			all.add(shoe);
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public Shoes findByShoesId(String shoes_id) throws Exception {
		// TODO Auto-generated method stub
		Shoes shoe=null;
		String sql="SELECT * FROM show_shoes WHERE shoes_id=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, shoes_id);
		ResultSet rs=this.pstmt.executeQuery();
		if(rs.next()){
			shoe=new Shoes();
			shoe.setShoes_id(rs.getString(1));
			shoe.setName(rs.getString(2));
			shoe.setBrand(rs.getString(4));
			shoe.setStyle(rs.getString(3));
			shoe.setGender(rs.getInt(5));
			shoe.setPrice(rs.getFloat(6));
			shoe.setSeller_id(rs.getString(7));
		}
		this.pstmt.close();
		return shoe;
	}
	@Override
	public HashMap<String, Integer> findShoes_Stock(String shoes_id, String seller_id) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Integer>stocks=new HashMap<String, Integer>();
		String sql="SELECT size,amount FROM stock WHERE store_id=? AND shoes_id=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, seller_id);
		this.pstmt.setString(2, shoes_id);
		ResultSet rs=this.pstmt.executeQuery();
		while(rs.next()){
			stocks.put(rs.getString(1), rs.getInt(2));
		}
		this.pstmt.close();
		return stocks;
	}
	@Override
	public boolean cart_Insert(String uid, String shoes_id, String size, String color) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="INSERT INTO cart(uid,shoes_id,time,size,color)VALUES(?,?,?,?,?)";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, uid);
		this.pstmt.setString(2, shoes_id);
		this.pstmt.setString(3, Format.getNowTime1());
		this.pstmt.setString(4, size);
		this.pstmt.setString(5, color);
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public List<Cart> findCartByUid(String uid) throws Exception {
		// TODO Auto-generated method stub
		List<Cart>all=new ArrayList<Cart>();
		String sql="SELECT * FROM cart WHERE uid=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, uid);
		ResultSet rs=this.pstmt.executeQuery();
		Cart cart=null;
		while(rs.next()){
			cart=new Cart();
			cart.setUid(rs.getString(1));
			cart.setShoes_id(rs.getString(2));
			cart.setTime(rs.getString(3));
			cart.setSize(rs.getString(4));
			cart.setColor(rs.getString(5));
			all.add(cart);
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public int findShoe_StockBySizeColor(String shoes_id, String size, String color) throws Exception {
		// TODO Auto-generated method stub
		int stocks=0;
		String sql="SELECT amount FROM stock WHERE shoes_id=? AND size=? AND color=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, shoes_id);
		this.pstmt.setString(2, size);
		this.pstmt.setString(3, color);
		ResultSet rs=this.pstmt.executeQuery();
		while(rs.next()){
			stocks=rs.getInt(1);
		}
		this.pstmt.close();
		return stocks;
	}
	@Override
	public List<String> getStockColor(String shoes_id, String seller_id) throws Exception {
		// TODO Auto-generated method stub
		List<String>all=new ArrayList<String>();
		String sql="SELECT DISTINCT color FROM stock WHERE shoes_id=? AND store_id=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, shoes_id);
		this.pstmt.setString(2, seller_id);
		ResultSet rs=this.pstmt.executeQuery();
		while(rs.next()){
			all.add(rs.getString(1));
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public boolean order_Submit(Orders order) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="INSERT INTO orders(order_id,shoes_id,uid,time,unit_price,total_price,item_amount,coupon_id,status,store_id,size,color,address_num)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, order.getOrder_id());
		this.pstmt.setString(2, order.getShoes_id());
		this.pstmt.setString(3, order.getUid());
		this.pstmt.setString(4, order.getTime());
		this.pstmt.setFloat(5, order.getUnit_price());
		this.pstmt.setFloat(6, order.getTotal_price());
		this.pstmt.setInt(7, order.getItem_amount());
		this.pstmt.setString(8, order.getCoupon_id());
		this.pstmt.setInt(9, order.getStatus());
		this.pstmt.setString(10,order.getSeller_id());
		this.pstmt.setString(11, order.getSize());
		this.pstmt.setString(12, order.getColor());
		this.pstmt.setInt(13, order.getAddress_num());
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public boolean delete_FromMyCart(String uid, String shoes_id, String size, String color) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="DELETE FROM cart WHERE uid=? AND shoes_id=? AND size=? AND color=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1,uid);
		this.pstmt.setString(2,shoes_id);
		this.pstmt.setString(3,size);
		this.pstmt.setString(4,color);
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public List<Orders> find_MyOrders(String uid) throws Exception {
		// TODO Auto-generated method stub
		List<Orders>all=new ArrayList<Orders>();
		String sql="SELECT * FROM orders WHERE uid=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, uid);
		ResultSet rs=this.pstmt.executeQuery();
		while(rs.next()){
			Orders order=new Orders();
			order.setOrder_id(rs.getString(1));
			order.setShoes_id(rs.getString(2));
			order.setUid(rs.getString(3));
			order.setTime(rs.getString(4));;
			order.setUnit_price(rs.getFloat(5));
			order.setTotal_price(rs.getFloat(6));
			order.setItem_amount(rs.getInt(7));
			order.setCoupon_id(rs.getString(8));
			order.setStatus(rs.getInt(9));
			order.setSeller_id(rs.getString(10));
			order.setSize(rs.getString(11));
			order.setColor(rs.getString(12));
			order.setAddress_num(rs.getInt(13));
			all.add(order);
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public boolean address_Insert(Address address) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="INSERT INTO address(uid,state,city,street,name,phone,zip_code,address_num)VALUES(?,?,?,?,?,?,?,?)";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, address.getUid());
		this.pstmt.setString(2, address.getState());
		this.pstmt.setString(3, address.getCity());
		this.pstmt.setString(4, address.getStreet());
		this.pstmt.setString(5, address.getName());
		this.pstmt.setString(6, address.getPhone());
		this.pstmt.setString(7, address.getZip_code());
		this.pstmt.setInt(8, address.getAddress_num());
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public List<Address> find_AllMyAddress(String uid) throws Exception {
		// TODO Auto-generated method stub
		List<Address>all=new ArrayList<Address>();
		String sql="SELECT * FROM address WHERE uid=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, uid);
		ResultSet rs=this.pstmt.executeQuery();
		while(rs.next()){
			Address address=new Address();
			address.setUid(rs.getString(1));
			address.setState(rs.getString(2));
			address.setCity(rs.getString(3));
			address.setStreet(rs.getString(4));
			address.setName(rs.getString(5));
			address.setPhone(rs.getString(6));
			address.setZip_code(rs.getString(7));
			address.setAddress_num(rs.getInt(8));
			all.add(address);
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public boolean address_Update(Address address) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="UPDATE address SET state=?,city=?,street=?,name=?,phone=?,zip_code=? WHERE uid=? AND address_num=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, address.getState());
		this.pstmt.setString(2, address.getCity());
		this.pstmt.setString(3, address.getStreet());
		this.pstmt.setString(4, address.getName());
		this.pstmt.setString(5, address.getPhone());
		this.pstmt.setString(6, address.getZip_code());
		this.pstmt.setString(7, address.getUid());
		this.pstmt.setInt(8, address.getAddress_num());
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public int get_Address_num(String uid) throws Exception {
		// TODO Auto-generated method stub
		int address_num=0;
		String sql="SELECT MAX(address_num) FROM address WHERE uid=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, uid);
		ResultSet rs=this.pstmt.executeQuery();
		if(rs.next()){
			address_num=rs.getInt(1)+1;
		}
		return address_num;
	}
	@Override
	public List<String> find_AllMyCoupon(String uid) throws Exception {
		// TODO Auto-generated method stub
		List<String>all=new ArrayList<String>();
		String sql="SELECT coupon_id FROM coupon_get WHERE uid=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, uid);
		ResultSet rs=this.pstmt.executeQuery();
		while(rs.next()){
			String coupon_id=rs.getString(1);
			all.add(coupon_id);
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public Coupon find_CouponById(String coupon_id) throws Exception {
		// TODO Auto-generated method stub
		Coupon coupon=null;
		String sql="SELECT * FROM coupon WHERE coupon_id=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, coupon_id);
		ResultSet rs=this.pstmt.executeQuery();
		if(rs.next()){
			coupon=new Coupon();
			coupon.setCoupon_id(rs.getString(1));
			coupon.setName(rs.getString(2));
			coupon.setType(rs.getInt(3));
			coupon.setSeller_id(rs.getString(4));
			coupon.setDiscount_price(rs.getFloat(5));
			coupon.setAmount(rs.getInt(6));
		}
		this.pstmt.close();
		return coupon;
	}
	@Override
	public List<Shoes> search_ShoesByKey(String[] keyWord) throws Exception {
		// TODO Auto-generated method stub
		List<Shoes>all=new ArrayList<Shoes>();
		String sql="SELECT * FROM show_shoes WHERE brand like ? OR style like ? limit 400";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, "%"+keyWord[0]+"%");
		this.pstmt.setString(2, "%"+keyWord[0]+"%");
		ResultSet rs=this.pstmt.executeQuery();
		while(rs.next()){
			Shoes shoe=new Shoes();
			shoe.setShoes_id(rs.getString(1));
			shoe.setName(rs.getString(2));
			shoe.setBrand(rs.getString(4));
			shoe.setStyle(rs.getString(3));
			shoe.setGender(rs.getInt(5));
			shoe.setPrice(rs.getFloat(6));
			shoe.setSeller_id(rs.getString(7));
			all.add(shoe);
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public Orders find_OrderById(String oid) throws Exception {
		// TODO Auto-generated method stub
		Orders order=null;
		String sql="SELECT * FROM orders WHERE order_id=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, oid);
		ResultSet rs=this.pstmt.executeQuery();
		if(rs.next()){
			order=new Orders();
			order.setOrder_id(rs.getString(1));
			order.setShoes_id(rs.getString(2));
			order.setUid(rs.getString(3));
			order.setTime(rs.getString(4));
			order.setUnit_price(rs.getFloat(5));
			order.setTotal_price(rs.getFloat(6));
			order.setItem_amount(rs.getInt(7));
			order.setCoupon_id(rs.getString(8));
			order.setStatus(rs.getInt(9));
			order.setSeller_id(rs.getString(10));
			order.setSize(rs.getString(11));
			order.setColor(rs.getString(12));
			order.setAddress_num(rs.getInt(13));
		}
		this.pstmt.close();
		return order;
	}
	@Override
	public List<Shoes> search_ShoesByBrand(String brand) throws Exception {
		// TODO Auto-generated method stub
		List<Shoes>all=new ArrayList<Shoes>();
		String sql="SELECT * FROM show_shoes WHERE brand=? ORDER BY price asc limit 200";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, brand);
		ResultSet rs=this.pstmt.executeQuery();
		Shoes shoe=null;
		while(rs.next()){
			shoe=new Shoes();
			shoe.setShoes_id(rs.getString(1));
			shoe.setName(rs.getString(2));
			shoe.setBrand(rs.getString(4));
			shoe.setStyle(rs.getString(3));
			shoe.setGender(rs.getInt(5));
			shoe.setPrice(rs.getFloat(6));
			shoe.setSeller_id(rs.getString(7));
			all.add(shoe);
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public boolean insert_Coupon(Coupon coupon) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="INSERT INTO coupon(coupon_id,name,type,seller_id,discount_price,amount,pic)VALUES(?,?,?,?,?,?,?)";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, coupon.getCoupon_id());
		this.pstmt.setString(2, coupon.getName());
		this.pstmt.setInt(3, coupon.getType());
		this.pstmt.setString(4, coupon.getSeller_id());
		this.pstmt.setFloat(5, coupon.getDiscount_price());
		this.pstmt.setInt(6, coupon.getAmount());
		this.pstmt.setString(7, coupon.getPic());
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public List<Coupon> show_AllCoupon() throws Exception {
		// TODO Auto-generated method stub
		List<Coupon>all=new ArrayList<Coupon>();
		String sql="SELECT * FROM coupon";
		this.pstmt=this.conn.prepareStatement(sql);
		ResultSet rs=this.pstmt.executeQuery();
		Coupon coupon=null;
		while(rs.next()){
			coupon=new Coupon();
			coupon.setCoupon_id(rs.getString(1));
			coupon.setName(rs.getString(2));
			coupon.setType(rs.getInt(3));
			coupon.setSeller_id(rs.getString(4));
			coupon.setDiscount_price(rs.getFloat(5));
			coupon.setAmount(rs.getInt(6));
			all.add(coupon);
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public boolean receive_Coupon(String uid, String coupon_id) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="INSERT INTO coupon_get(uid,coupon_id,use_state)VALUES(?,?,0)";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, uid);
		this.pstmt.setString(2, coupon_id);
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		String sql2="UPDATE coupon SET amount=amount-1 WHERE coupon_id=?";
		this.pstmt=this.conn.prepareStatement(sql2);
		this.pstmt.setString(1, coupon_id);
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public String sellerLoginValidate(String seller_id, String password) throws Exception {
		// TODO Auto-generated method stub
		String store_id=null;
		String sql="SELECT store_id FROM salesperson WHERE sale_id=? AND password=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,seller_id);
		pstmt.setString(2,password);
		ResultSet rs=this.pstmt.executeQuery();
		if(rs.next()){
			store_id=rs.getString(1);
		}
		return store_id;
	}
	
	@Override
	public List<Orders> find_SellerOrders(String storeid) throws Exception {
		// TODO Auto-generated method stub
		List<Orders>all=new ArrayList<Orders>();
		String sql="SELECT order_id, uid, time, item_amount, total_price, status FROM orders WHERE store_id=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1,storeid);  //?:=keyWord
		ResultSet rs=this.pstmt.executeQuery(); //implement 
		while(rs.next()){
			Orders order=new Orders();
			order.setOrder_id(rs.getString(1)); //1 equal to the sequence of the attribute in the table
			order.setUid(rs.getString(2));
			order.setTime(rs.getString(3)); 
			order.setItem_amount(rs.getInt(4));
			order.setTotal_price(rs.getInt(5));
			order.setStatus(rs.getInt(6));
			all.add(order);
		}
		this.pstmt.close();
		return all;
	}
	
	@Override
	public boolean create_shoesdata(Shoes shoe) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		try{
		conn.setAutoCommit(false);
		String sql="INSERT INTO shoes(shoes_id,name,style,brand,gender)VALUES(?,?,?,?,?)";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, shoe.getShoes_id());
		this.pstmt.setString(2, shoe.getName());
		this.pstmt.setString(3, shoe.getStyle());
		this.pstmt.setString(4, shoe.getBrand());
		this.pstmt.setInt(5, shoe.getGender());
		this.pstmt.executeUpdate();
		String sql2="INSERT INTO shoes_store(shoes_id,store_id,name,price)VALUES(?,?,?,?)";
		this.pstmt=this.conn.prepareStatement(sql2);
		this.pstmt.setString(1, shoe.getShoes_id());
		this.pstmt.setString(2, shoe.getSeller_id());
		this.pstmt.setString(3, shoe.getName());
		this.pstmt.setFloat(4, shoe.getPrice());
		this.pstmt.executeUpdate();
		conn.commit();
		this.pstmt.close();
		}
		catch(Exception e){
			conn.rollback();
			System.out.println("rollback");
		}
		return flag;
	}
	@Override
	public boolean create_stockdata(Shoes shoe, Stock stock) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql3="INSERT INTO stock(shoes_id,store_id,size,color,amount)VALUES(?,?,?,?,?)";
		this.pstmt=this.conn.prepareStatement(sql3);
		this.pstmt.setString(1, shoe.getShoes_id());
		this.pstmt.setString(2, shoe.getSeller_id());
		this.pstmt.setString(3, stock.getSize());
		this.pstmt.setString(4, stock.getColor());
		this.pstmt.setInt(5, stock.getAmount());
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	
	public Salesperson Sale_info(String seller_id) throws Exception {
		// TODO Auto-generated method stub
		Salesperson seller=null;
		String sql="SELECT sale_id, regin_ID, email, store_id, salary FROM salesperson Where sale_id=?";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, seller_id);
		ResultSet rs=this.pstmt.executeQuery();
		if(rs.next()){
		   seller=new Salesperson();
		   seller.setSale_id(rs.getString(1));
		   seller.setRegin_id(rs.getInt(2));
		   seller.setEmail(rs.getString(3));
		   seller.setStore_id(rs.getString(4));
		   seller.setSalary(rs.getInt(5));
		}
		this.pstmt.close();
		return seller;        
	}
	
	@Override
	public boolean update_SellerOrders(String orderid) throws Exception {
	// TODO Auto-generated method stub	
	boolean flag=false;
	String sql="UPDATE orders SET status=3  WHERE order_id =?";
	this.pstmt=this.conn.prepareStatement(sql);
	this.pstmt.setString(1,orderid);  //?:=keyWord
	this.pstmt.executeUpdate(); //implement 
	if(this.pstmt.executeUpdate()>0){
		flag=true;
	}
	this.pstmt.close();
	return flag;
}
	@Override
	public boolean insert_homeUser(String uid, int gender, int age, float income, int marriage)throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="INSERT INTO use_home(uid,gender,age,income,marriage)VALUES(?,?,?,?,?)";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, uid);
		this.pstmt.setInt(2, gender);
		this.pstmt.setInt(3, age);
		this.pstmt.setFloat(4, income);
		this.pstmt.setInt(5, marriage);
	
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public boolean insert_BusyUser(String uid, String business_cat, String company)throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="INSERT INTO use_home(uid,gender,age,income,marriage)VALUES(?,?,?,?,?)";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, uid);
		this.pstmt.setString(2, business_cat);
		this.pstmt.setString(3, company);
	
	
		if(this.pstmt.executeUpdate()>0){
			flag=true;
		}
		this.pstmt.close();
		return flag;
	}
	@Override
	public List<Shoes> search_ShoesAdvannced(String brand, String style, float[] price) throws Exception {
		// TODO Auto-generated method stub
		List<Shoes>all=new ArrayList<Shoes>();
		
		String sql="SELECT * FROM show_shoes where brand=? AND style=? AND price BETWEEN ? and ? LIMIT 100";
		this.pstmt=this.conn.prepareStatement(sql);
		this.pstmt.setString(1, brand);
		this.pstmt.setString(2, style);
		this.pstmt.setFloat(3, price[0]);
		this.pstmt.setFloat(4, price[1]);
		ResultSet rs=this.pstmt.executeQuery();
		Shoes shoe=null;
		while(rs.next()){
			shoe=new Shoes();
			shoe.setShoes_id(rs.getString(1));
			shoe.setName(rs.getString(2));
			shoe.setBrand(rs.getString(4));
			shoe.setStyle(rs.getString(3));
			shoe.setGender(rs.getInt(5));
			shoe.setPrice(rs.getFloat(6));
			shoe.setSeller_id(rs.getString(7));
			all.add(shoe);
		}
		this.pstmt.close();
		return all;
	}
	@Override
	public HashMap<String, Float> system_todayBrandMoney() throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Float>brandMap=new HashMap<String, Float>();
		String sql="SELECT * FROM order_brand";
		this.pstmt=this.conn.prepareStatement(sql);
		ResultSet rs=this.pstmt.executeQuery();
		while(rs.next()){
			brandMap.put(rs.getString(1), rs.getFloat(2));
		}
		this.pstmt.close();
		return brandMap;
	}
	
	@Override
	public HashMap<String, Float> system_todayColorMoney() throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Float>brandMap=new HashMap<String, Float>();
		String sql="SELECT * FROM order_color";
		this.pstmt=this.conn.prepareStatement(sql);
		ResultSet rs=this.pstmt.executeQuery();
		while(rs.next()){
			brandMap.put(rs.getString(1), rs.getFloat(2));
		}
		this.pstmt.close();
		return brandMap;
	}
	
	//*************************DATA_Aggregation**********
		@Override
		public List<Brand_Buss> get_Brand() throws Exception {
			// TODO Auto-generated method stub
			List<Brand_Buss>all=new ArrayList<Brand_Buss>();
			Brand_Buss buss=null;
			String sql="SELECT business, bsell_num FROM brand_salenum ORDER BY bsell_num desc";
			this.pstmt=this.conn.prepareStatement(sql);
			ResultSet rs=this.pstmt.executeQuery();
			while(rs.next()){
			   buss=new Brand_Buss();
			   buss.setBusiness(rs.getString(1));
			   buss.setBsell_num(rs.getInt(2));
			   all.add(buss);
			}
			this.pstmt.close();
			return all; 
		}
		@Override
		public List<Cate_Num> get_Cate() throws Exception {
			// TODO Auto-generated method stub
			List<Cate_Num>all=new ArrayList<Cate_Num>();
			String sql="SELECT categories, csell_num FROM categories_salenum ORDER BY csell_num desc";
			this.pstmt=this.conn.prepareStatement(sql);
			ResultSet rs=this.pstmt.executeQuery();
			Cate_Num cate=null;
			while(rs.next()){
			   cate=new Cate_Num();
			   cate.setBusiness(rs.getString(1));
			   cate.setCsell_num(rs.getInt(2));
			   all.add(cate);
			}
			this.pstmt.close();
			return all; 
		}
		@Override
		public List<Regin_Num> get_Regin() throws Exception {
			// TODO Auto-generated method stub
			List<Regin_Num>all=new ArrayList<Regin_Num>();
			String sql="SELECT regin, rsell_num FROM regin_salenum ORDER BY rsell_num desc";
			this.pstmt=this.conn.prepareStatement(sql);
			ResultSet rs=this.pstmt.executeQuery();
			Regin_Num cate=null;
			while(rs.next()){
			   cate=new Regin_Num();
			   cate.setRegin(rs.getString(1));
			   cate.setRsell_num(rs.getInt(2));
			   all.add(cate);
			}
			this.pstmt.close();
			return all; 
		}
		@Override
		public List<Store_Profit> get_Profit(String storeid) throws Exception {
			// TODO Auto-generated method stub
			List<Store_Profit>all=new ArrayList<Store_Profit>();
			String sql="SELECT store_id, profit FROM store_profit WHERE store_id=?";
			this.pstmt=this.conn.prepareStatement(sql);
			this.pstmt.setString(1,storeid);
			ResultSet rs=this.pstmt.executeQuery();
			Store_Profit cate=null;
			while(rs.next()){
			   cate=new Store_Profit();
			   cate.setRegin(rs.getString(1));
			   cate.setRsell_num(rs.getInt(2));
			   all.add(cate);
			}
			this.pstmt.close();
			return all; 
		}
		@Override
		public List<Shoes> search_ShoesByStore(String store_id) throws Exception {
			// TODO Auto-generated method stub
			List<Shoes>all=new ArrayList<Shoes>();
			String sql="SELECT * FROM show_shoes WHERE store_id=? limit 200";
			this.pstmt=this.conn.prepareStatement(sql);
			this.pstmt.setString(1, store_id);
			ResultSet rs=this.pstmt.executeQuery();
			Shoes shoe=null;
			while(rs.next()){
				shoe=new Shoes();
				shoe.setShoes_id(rs.getString(1));
				shoe.setName(rs.getString(2));
				shoe.setBrand(rs.getString(4));
				shoe.setStyle(rs.getString(3));
				shoe.setGender(rs.getInt(5));
				shoe.setPrice(rs.getFloat(6));
				shoe.setSeller_id(rs.getString(7));
				all.add(shoe);
			}
			this.pstmt.close();
			return all;
		}

		
		@Override
		public boolean insert_Shoes(Shoes shoe,int amount,String size, String color) throws Exception {
			// TODO Auto-generated method stub
			boolean flag=false;
			String sql="INSERT INTO shoes(shoes_id,name,style,brand,gender)VALUES(?,?,?,?,?)";
			this.pstmt=this.conn.prepareStatement(sql);
			this.pstmt.setString(1, shoe.getShoes_id());
			this.pstmt.setString(2, shoe.getName());
			this.pstmt.setString(4, shoe.getBrand());
			this.pstmt.setString(3, shoe.getStyle());
			this.pstmt.setInt(5, shoe.getGender());
			if(this.pstmt.executeUpdate()>0){
				flag=true;
			}
			this.pstmt.close();
			String sql2="INSERT INTO shoes_store(shoes_id,store_id,name,price)VALUES(?,?,?,?)";
			this.pstmt=this.conn.prepareStatement(sql2);
			this.pstmt.setString(1, shoe.getShoes_id());
			this.pstmt.setString(3, shoe.getName());
			this.pstmt.setString(2, shoe.getSeller_id());
			this.pstmt.setFloat(4, shoe.getPrice());
			if(this.pstmt.executeUpdate()>0){
				flag=true;
			}
			this.pstmt.close();
			String sql3="INSERT INTO stock(shoes_id,store_id,size,color,amount)VALUES(?,?,?,?,?)";
			this.pstmt=this.conn.prepareStatement(sql3);
			this.pstmt.setString(1, shoe.getShoes_id());
			this.pstmt.setString(2, shoe.getSeller_id());
			this.pstmt.setString(4, size);
			this.pstmt.setString(3, color);
			this.pstmt.setInt(5, amount);
			if(this.pstmt.executeUpdate()>0){
				flag=true;
			}
			this.pstmt.close();
			return flag;
		}
		@Override
		public List<Shoes> findShoesByStore_id(String store_id) throws Exception {
			// TODO Auto-generated method stub
			List<Shoes>all=new ArrayList<Shoes>();
			String sql="SELECT * FROM show_shoes Where store_id = ? limit 100";
			this.pstmt=this.conn.prepareStatement(sql);
			this.pstmt.setString(1, store_id);
			ResultSet rs=this.pstmt.executeQuery();
			Shoes shoe=null;
			while(rs.next()){
				shoe=new Shoes();
				shoe.setShoes_id(rs.getString(1));
				shoe.setName(rs.getString(2));
				shoe.setBrand(rs.getString(3));
				shoe.setStyle(rs.getString(4));
				shoe.setGender(rs.getInt(5));
				shoe.setPrice(rs.getFloat(6));
				shoe.setSeller_id(rs.getString(7));
				all.add(shoe);
			}
			this.pstmt.close();
			return all;		
		}
		@Override
		public List<Stock> findStockByStore_id(String store_id, String shoes_id) throws Exception {
			// TODO Auto-generated method stub
			List<Stock>all=new ArrayList<Stock>();
			String sql="SELECT * FROM stock WHERE store_id = ? AND shoes_id = ? limit 100" ;
			this.pstmt=this.conn.prepareStatement(sql);
			this.pstmt.setString(1, store_id);
			this.pstmt.setString(2, shoes_id);
			ResultSet rs=this.pstmt.executeQuery();
			Stock stock=null;
			while(rs.next()){
				stock=new Stock();
				stock.setShoes_id(rs.getString(1));
				stock.setSeller_id(rs.getString(2));
				stock.setSize(rs.getString(3));
				stock.setColor(rs.getString(4));
				stock.setAmount(rs.getInt(5));
				all.add(stock);
			}
			this.pstmt.close();
			return all;		
		}
		@Override
		public boolean delete_shoes(String shoes_id) throws Exception {
			// TODO Auto-generated method stub
			boolean flag=false;
			String sql="DELETE FROM shoes WHERE shoes_id=? ";
			this.pstmt=this.conn.prepareStatement(sql);		
			this.pstmt.setString(1,shoes_id);		
			if(this.pstmt.executeUpdate()>0){
				flag=true;
			}
			this.pstmt.close();
			return flag;
		}
		@Override
		public boolean update_shoes(String shoes_id,String store_id,int amount, String size, String color) throws Exception {
			// TODO Auto-generated method stub
			boolean flag = false;
			String sql="update stock SET amount=? WHERE shoes_id=? AND store_id=? and size=? and color=?" ;
			this.pstmt=this.conn.prepareStatement(sql);
			this.pstmt.setInt(1, amount);
			this.pstmt.setString(4, size);
			this.pstmt.setString(5, color);
			this.pstmt.setString(2, shoes_id);
			this.pstmt.setString(3, store_id);
			if(this.pstmt.executeUpdate()>0){
				flag=true;
			}
			this.pstmt.close();
			return flag;	
		}
		@Override
		public boolean order_Return(String oid) throws Exception {
			// TODO Auto-generated method stub
			boolean flag = false;
			String sql="update orders SET status=4 WHERE order_id=?" ;
			this.pstmt=this.conn.prepareStatement(sql);
			this.pstmt.setString(1, oid);
			if(this.pstmt.executeUpdate()>0){
				flag=true;
			}
			this.pstmt.close();
			return flag;	
		}
		@Override
		public boolean order_Confirm(String oid) throws Exception {
			// TODO Auto-generated method stub
			boolean flag = false;
			String sql="update orders SET status=1 WHERE order_id=?" ;
			this.pstmt=this.conn.prepareStatement(sql);
			this.pstmt.setString(1, oid);
			if(this.pstmt.executeUpdate()>0){
				flag=true;
			}
			this.pstmt.close();
			return flag;	
		}
		@Override
		public int[] system_Usernum() throws Exception {
			// TODO Auto-generated method stub
			int [] a={0,0,0,0};
			String sql="SELECT * FROM system_usernum" ;
			this.pstmt=this.conn.prepareStatement(sql);
			ResultSet rs=this.pstmt.executeQuery();
			while(rs.next()){
				a[0] = rs.getInt(1);
				a[1] = rs.getInt(2);
				a[2] = rs.getInt(3);
				a[3] = rs.getInt(4);
			}
			this.pstmt.close();
			return a;	
		}

		
}
