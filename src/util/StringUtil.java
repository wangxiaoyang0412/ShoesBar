package util;

public class StringUtil {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		get_KeyWords_test("va");
	}

	public static String[] get_KeyWords_test(String kw){
		String [] arr = kw.split("\\s+");
		for(String ss : arr){
		    System.out.println(ss);
		}
		return arr;
		
	}
	
	public static String[] get_KeyWords(String kw){
		String [] arr = kw.split("\\s+");
		for(String ss : arr){
		    System.out.println(ss);
		}
		return arr;
		
	}
}
