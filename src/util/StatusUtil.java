package util;

public class StatusUtil {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s=order_Status(3);
		System.out.println(s);
	}

	public static String order_Status(int status){
		String s=null;
		switch(status){
		case 1: s="confirmed";break;
		case 2: s="wait";break;
		case 3: s="delivered";break;
		case 4: s="returnning";break;
		case 5: s="returned";break;
		}
		return s;
	}
		
}
