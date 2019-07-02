package poly.util;

public class CmmUtil {
	public static String nvl(String str, String chg_str) {
		String res;

		if (str == null) {
			res = chg_str;
		} else if (str.equals("")) {
			res = chg_str;
		} else {
			res = str;
		}
		return res;
	}
	
	public static String nvl(String str){
		return nvl(str,"");
	}
	
	public static String checked(String str, String com_str){
		if(str.equals(com_str)){
			return " checked";
		}else{
			return "";
		}
	}
	
	public static String checked(String[] str, String com_str){
		for(int i=0;i<str.length;i++){
			if(str[i].equals(com_str))
				return " checked";
		}
		return "";
	}
	
	public static String select(String str,String com_str){
		if(str.equals(com_str)){
			return " selected";
		}else{
			return "";
		}
	}
	
	public static String cut(String str) {
	
		return str.substring(1, str.length()-1);
		
	}
	
	public static String restoreXSS(String value) {
	       //You'll need to remove the spaces from the html entities below
	       value = value.replaceAll("& lt;", "< ").replaceAll("& gt;"," >");
	       value = value.replaceAll("& #40;", "\\(").replaceAll("& #41;", "\\)");
	       value = value.replaceAll("& #39;", "'");
	       value = value.replaceAll("\"\"", "[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']");
	       return value;
	    }
	
}
