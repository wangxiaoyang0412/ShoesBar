package util;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class Format {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		System.out.print(get_VerificationCode(6));
	
		
	}

	public static String getNowTime1(){
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		return df.format(new Date());
		
	}
	
	public static String getNowTime2(){
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		 return df.format(new Date());
		
	}
	
	public static String getOrderId(){
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		int flag=0;
		String timeStamp=df.format(new Date());
		for (int i = 0; i <= 100; i++)
		{
		    flag = new Random().nextInt(999999);
		    if (flag < 100000)
		    {
		        flag += 100000;
		    }
		    
		}

				return timeStamp+String.valueOf(flag);
	}
	
	public static int generateAddress_num(String uid) throws Exception{    //create address_num
		int address_num=0;
		address_num=Factory.getIEmpDAOInstance().get_Address_num(uid);
		return address_num;
	}
	
	
	//get verification code
	public static String get_VerificationCode(int unit){
		
		String yz=getStringRandom(unit).toString();
		return yz;
	}
	
	public static String getStringRandom(int length) {

		String val = "";
		Random random = new Random();

		//参数length，表示生成几位随机数
		for(int i = 0; i < length; i++) {

		String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
		//输出字母还是数字
		if( "char".equalsIgnoreCase(charOrNum) ) {
		//输出是大写字母还是小写字母
		int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
		val += (char)(random.nextInt(26) + temp);
		} else if( "num".equalsIgnoreCase(charOrNum) ) {
		val += String.valueOf(random.nextInt(10));
		}
		}
		return val;
		}
}
