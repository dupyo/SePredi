# 크롤링 및 RestAPI를 활용한 축구 선수 검색 웹 어플리케이션

### **개발자**
 - 홍두표([@dupyo])      
   
### **What is SePredi?**
 - The System that could search football players of the world and predict football matches based on crawling data.      
  

### **설  명**

 > *SePredi는 축구 선수 크롤링 검색 웹 어플리케이션으로 개인프로젝트 웹 구현을 위해 개발하였다.  
원하는 선수에 대한 정보가 부족하거나 불명확한 경우 사용자가 웹을 통해 편리하게 선수를 검색하여 찾을 수 있도록 구현한 웹이다.  
웹 서버는 `AWS(Amazon Web Service)`에서 제공하는 무료 인스턴스를 사용하여 IP를 할당 받아 구축하였다.  
검색 창에 선수의 이름을 입력하면 이름을 구글과 나무위키에 검색하고 크롤링한 후 해당 선수를 DB에서 조회하여 결과를 불러온다.  
검색 결과는 자체적으로 Rest서버를 구축한 후 Ajax를 활용하여 메인 서버에서 요청하는 자원을 받는 형식으로 동작한다.  
`RestAPI`를 이용하여 카카오 계정으로 로그인하는 기능을 통해 불필요한 회원가입이나 이메일 인증 등의 번거로움을 최소화 하였다.  
스포츠 관련 지식이나 견해를 공유하기 위해 게시판이 구성되어 있고, 작성자 본인만이 게시물을 삭제할 수 있는 기능도 존재한다.  
해당 웹 구현을 통하여 사용자들이 찾고자 하는 선수 정보를 편리하게 검색하고 간편 로그인 후 게시판을 만들어 스포츠 지식과 견해를 공유할 수 있다.*   
  

### **적용 기술**

| 구분 | 적용 기술 |
| ------ | ------ |
| 프레임워크 | Spring FrameWork |
| 데이터베이스 | MySQL |
| 공공데이터(OpenAPI) | 카카오 계정 소셜 로그인 연동(RestAPI) |
| 서버 | AWS(Amazon Web Service) 웹 서버 구축 |
| 비동기 통신 | Ajax |
| Java | jdk1.8.0_261 |
| 부트스트랩 | Bootstrap 3.3.5 |
| JQuery | JQuery v3.4.0 |
| 크롤링 | 구글 및 나무위키 크롤링 |
| 기타 | 자체 Rest서버 구축 |

[@dupyo]: https://github.com/dupyo
