package poly.util;

import java.util.regex.Pattern;

public class DataType {
	public static String getType(String word) {
		
		if (Pattern.matches("^[0-9]*$", word)) {
			return "nu";
		} else if (Pattern.matches("^[a-zA-Z]*$", word)) {
			return "en";
		} else if (Pattern.matches("^[0-9a-zA-Z]*$", word)) {
			return "enNnu";
		} else if (Pattern.matches("^[ㄱ-ㅎㅏ-ㅣ가-힣]*$", word)) {
			return "kr";
		} else if (Pattern.matches("^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]*$", word)) {
			return "enNkr";
		} else if (Pattern.matches("^[0-9ㄱ-ㅎㅏ-ㅣ가-힣]*$", word)) {
			return "krNnu";
		} else if (Pattern.matches("^[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]*$", word)) {
			return "enNkrNnu";
		} else if (Pattern.matches("^[0-9ㄱ-ㅎㅏ-ㅣ가-힣\\~\\`\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\_\\-\\+\\=\\{\\[\\}\\]\\|\\\\\\:\\;\\\"\\'\\<\\,\\>\\.\\?\\/]*$", word)) {
			return "specialchar";
		} else if (Pattern.matches("[\\★]", word)) {
			return "star";
		}
		return "unidentified";
	}
}
