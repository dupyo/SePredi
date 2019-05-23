package poly.util;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JSONReadFromFile {
	//private Logger log = Logger.getLogger(this.getClass());
	
	//WebContent 폴더 밑에 있는 json형식  파일을 불러와서 원하는 키값에 해당하는 밸류값을 반환해줌
	//읽고자 하는 json형식 파일의 파일경로를 WebContent밑부터 url인자값으로 지정하고 원하는 키값을 name인자값으로 지정해주면 키값에 해당하는 밸류값을 반환  
	public static String parseJSON(String name, String url) {

		String value = "";
		JSONParser parser = new JSONParser();
		
		try {
			//WebContent 폴더 밑에 있는 파일 불러오기
			Object obj = parser.parse(new FileReader("C:\\SePredi\\SpringPRJ\\WebContent\\" + url));
	 
			JSONObject jsonObject = (JSONObject) obj;
	 
			value = (String) jsonObject.get(name);
			System.out.println("name : " + name);
			System.out.println("value : " + value);
	
			// loop array
			/*JSONArray msg = (JSONArray) jsonObject.get("messages");
			Iterator<String> iterator = msg.iterator();
			
			while (iterator.hasNext()) {
				System.out.println(iterator.next());
			}*/
	 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return value;
	}


}
