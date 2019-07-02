package poly.util;

import javax.servlet.http.HttpSession;

public class InitSession {
	public static HttpSession initSession() {
		HttpSession session = null; 
		session.setAttribute("id", "");
		session.setAttribute("name", "");
		session.setAttribute("email", "");
		return session;
	}
}
