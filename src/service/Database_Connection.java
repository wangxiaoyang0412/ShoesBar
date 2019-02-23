package service;

import java.sql.Connection;
import java.sql.DriverManager;
public class Database_Connection {
	private static final String DBDRIVER="com.mysql.jdbc.Driver";
	private static final String DBURL="jdbc:mysql://localhost:3306/shoesbar?characterEncoding=utf8&useSSL=true&useLegacyDatetimeCode=false&serverTimezone=America/New_York";
	private static final String DBUSER="root";
	private static final String DBPASSWORD="15520089985Gc";
	
	private Connection conn=null;
	
	public Database_Connection()throws Exception{
		try{
			SslUtils.ignoreSsl();
			Class.forName(DBDRIVER);
			this.conn=DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
		}catch(Exception e){
			throw e;
		}
	}
	
	public Connection getConnection() throws Exception{
		SslUtils.ignoreSsl();
		return this.conn;
	}
	
	public void close()throws Exception{
		if(this.conn!=null){
			try{
				this.conn.close();
			}catch(Exception e){
				throw e;
			}
		}
	}
}

