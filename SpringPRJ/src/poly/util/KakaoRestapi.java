package poly.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import poly.controller.UserController;

import com.fasterxml.jackson.databind.JsonNode;


public class KakaoRestapi {
	
	public static JsonNode getKakaoAccessToken(String code) {
			
		final String RequestUrl = "https://kauth.kakao.com/oauth/token"; // Host
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		//String clientID = JSONReadFromFile.parseJSON("client_id", "/jsonData/secretKey.json"); //WebContent 폴더 밑에 있는 json형식 파일 불러오기
		
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "2f12756252a402b836eaace8e1fe9934")); // REST API KEY
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/kakaologin.do")); // 리다이렉트 URI
		/*postParams.add(new BasicNameValuePair("expire", "10")); // 로그인시 발급받는 토큰의 만료시간 설정 성공 시 닥치고 퇴근
		postParams.add(new BasicNameValuePair("expiration_time", "10")); // 로그인시 발급받는 토큰의 만료시간 설정 성공 시 닥치고 퇴근
		postParams.add(new BasicNameValuePair("expires", "10")); // 로그인시 발급받는 토큰의 만료시간 설정 성공 시 닥치고 퇴근
		postParams.add(new BasicNameValuePair("expires_in", "10")); // 로그인시 발급받는 토큰의 만료시간 설정 성공 시 닥치고 퇴근
		postParams.add(new BasicNameValuePair("expires_in/max_age", "0/0")); // 로그인시 발급받는 토큰의 만료시간 설정 성공 시 닥치고 퇴근
		postParams.add(new BasicNameValuePair("max_age", "10")); // 로그인시 발급받는 토큰의 만료시간 설정 성공 시 닥치고 퇴근
		postParams.add(new BasicNameValuePair("exp", "10")); // 로그인시 발급받는 토큰의 만료시간 설정 성공 시 닥치고 퇴근*/
		postParams.add(new BasicNameValuePair("code", code)); // 로그인 과정중 얻은 code 값
	
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
	
		JsonNode returnNode = null;
	
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
	
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
	
			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Post parameters : " + postParams);
			System.out.println("Response Code : " + responseCode);
	
			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
	
			returnNode = mapper.readTree(response.getEntity().getContent());
	
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
		}

		return returnNode;
	}	
	
	
	
	
	
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		 
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
	
		// add header
		post.addHeader("Authorization", "Bearer " + accessToken);
	
		JsonNode returnNode = null;
	
		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
	
			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);
	
			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
	
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
	
		return returnNode;
	}
	
	
	
	
	
	public static JsonNode disconnectToken(JsonNode autorize_code) {
	
		final String RequestUrl = "https://kapi.kakao.com/v1/user/unlink";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
	
		// add header
		post.addHeader("Authorization", "Bearer " + autorize_code);
	
		JsonNode returnNode = null;
	
		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);
			
			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
	
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
	
		}
	
		return returnNode;
	}
	
	
	
	
	
	public static JsonNode kakaoLogout(JsonNode autorize_code) {
	
		final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
	
		// add header
		post.addHeader("Authorization", "Bearer " + autorize_code);
		post.addHeader("exp", "Number " + "10");
	
		JsonNode returnNode = null;
	
		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);
			
			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
	
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
	
		}
	
		return returnNode;
	}
	
	
	

}
