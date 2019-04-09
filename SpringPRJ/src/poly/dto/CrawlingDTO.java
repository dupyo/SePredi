package poly.dto;


public class CrawlingDTO {

	private String getCrawlingNo; // 기본키, 순번
	private String player; // 선수명
	private String team; // 클럽명
	private String goals; // 득점
	private String date; // 경기일자
	private String tackles; // 태클횟수
	private String slidingTackles; // 슬라이딩태클횟수
	private String fullTimeRusult; // 풀타임결과(H=Home Win, D=Draw, A=Away Win)
	private String harfTimeRusult; // 하프타임결과(H=Home Win, D=Draw, A=Away Win)
	
	private String homeTeamSaves; // 홈팀세이브
	private String fullTimeHomeTeamGoals; // 풀타입홈팀득점수
	private String harfTimeHomeTeamGoals; // 하프홈팀득점수
	private String homeTeamShots; // 홈팀슈팅횟수
	private String homeTeamShotsOnTarget; // 홈팀유효슈팅횟수
	private String homeTeamYellowCards; // 홈팀경고(옐로우카드)
	private String homeTeamRedCards; // 홈팀퇴장(레드카드)
	private String homeTeamPenalties; // 홈팀패널티킥횟수
	private String homeTeamFreeKicks; // 홈팀프리킥횟수
	private String homeTeamCornerKicks; // 홈팀코너킥횟수
	private String homeTeam; // 홈팀명
	
	private String awayTeamSaves; // 원정팀세이브
	private String fullTimeAwayTeamGoals; // 풀타임원정팀득점수
	private String harfTimeAwayTeamGoals; // 하프원정팀득점수
	private String awayTeamShots; // 원정팀슈팅횟수
	private String awayTeamShotsOnTarget; // 원정팀유효슈팅횟수
	private String awayTeamYellowCards; // 원정팀경고(옐로우카드)
	private String awayTeamRedCards; // 원정팀퇴장(레드카드)
	private String awayTeamPenalties; // 원정팀패널티킥횟수
	private String awayTeamFreeKicks; // 원정팀프리킥횟수
	private String awayTeamCornerKicks; // 원정팀코너킥횟수
	private String awayTeam; // 원정팀명
	
	
	public String getGetCrawlingNo() {
		return getCrawlingNo;
	}
	public void setGetCrawlingNo(String getCrawlingNo) {
		this.getCrawlingNo = getCrawlingNo;
	}
	public String getPlayer() {
		return player;
	}
	public void setPlayer(String player) {
		this.player = player;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getGoals() {
		return goals;
	}
	public void setGoals(String goals) {
		this.goals = goals;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTackles() {
		return tackles;
	}
	public void setTackles(String tackles) {
		this.tackles = tackles;
	}
	public String getSlidingTackles() {
		return slidingTackles;
	}
	public void setSlidingTackles(String slidingTackles) {
		this.slidingTackles = slidingTackles;
	}
	public String getFullTimeRusult() {
		return fullTimeRusult;
	}
	public void setFullTimeRusult(String fullTimeRusult) {
		this.fullTimeRusult = fullTimeRusult;
	}
	public String getHarfTimeRusult() {
		return harfTimeRusult;
	}
	public void setHarfTimeRusult(String harfTimeRusult) {
		this.harfTimeRusult = harfTimeRusult;
	}
	public String getHomeTeamSaves() {
		return homeTeamSaves;
	}
	public void setHomeTeamSaves(String homeTeamSaves) {
		this.homeTeamSaves = homeTeamSaves;
	}
	public String getFullTimeHomeTeamGoals() {
		return fullTimeHomeTeamGoals;
	}
	public void setFullTimeHomeTeamGoals(String fullTimeHomeTeamGoals) {
		this.fullTimeHomeTeamGoals = fullTimeHomeTeamGoals;
	}
	public String getHarfTimeHomeTeamGoals() {
		return harfTimeHomeTeamGoals;
	}
	public void setHarfTimeHomeTeamGoals(String harfTimeHomeTeamGoals) {
		this.harfTimeHomeTeamGoals = harfTimeHomeTeamGoals;
	}
	public String getHomeTeamShots() {
		return homeTeamShots;
	}
	public void setHomeTeamShots(String homeTeamShots) {
		this.homeTeamShots = homeTeamShots;
	}
	public String getHomeTeamShotsOnTarget() {
		return homeTeamShotsOnTarget;
	}
	public void setHomeTeamShotsOnTarget(String homeTeamShotsOnTarget) {
		this.homeTeamShotsOnTarget = homeTeamShotsOnTarget;
	}
	public String getHomeTeamYellowCards() {
		return homeTeamYellowCards;
	}
	public void setHomeTeamYellowCards(String homeTeamYellowCards) {
		this.homeTeamYellowCards = homeTeamYellowCards;
	}
	public String getHomeTeamRedCards() {
		return homeTeamRedCards;
	}
	public void setHomeTeamRedCards(String homeTeamRedCards) {
		this.homeTeamRedCards = homeTeamRedCards;
	}
	public String getHomeTeamPenalties() {
		return homeTeamPenalties;
	}
	public void setHomeTeamPenalties(String homeTeamPenalties) {
		this.homeTeamPenalties = homeTeamPenalties;
	}
	public String getHomeTeamFreeKicks() {
		return homeTeamFreeKicks;
	}
	public void setHomeTeamFreeKicks(String homeTeamFreeKicks) {
		this.homeTeamFreeKicks = homeTeamFreeKicks;
	}
	public String getHomeTeamCornerKicks() {
		return homeTeamCornerKicks;
	}
	public void setHomeTeamCornerKicks(String homeTeamCornerKicks) {
		this.homeTeamCornerKicks = homeTeamCornerKicks;
	}
	public String getHomeTeam() {
		return homeTeam;
	}
	public void setHomeTeam(String homeTeam) {
		this.homeTeam = homeTeam;
	}
	public String getAwayTeamSaves() {
		return awayTeamSaves;
	}
	public void setAwayTeamSaves(String awayTeamSaves) {
		this.awayTeamSaves = awayTeamSaves;
	}
	public String getFullTimeAwayTeamGoals() {
		return fullTimeAwayTeamGoals;
	}
	public void setFullTimeAwayTeamGoals(String fullTimeAwayTeamGoals) {
		this.fullTimeAwayTeamGoals = fullTimeAwayTeamGoals;
	}
	public String getHarfTimeAwayTeamGoals() {
		return harfTimeAwayTeamGoals;
	}
	public void setHarfTimeAwayTeamGoals(String harfTimeAwayTeamGoals) {
		this.harfTimeAwayTeamGoals = harfTimeAwayTeamGoals;
	}
	public String getAwayTeamShots() {
		return awayTeamShots;
	}
	public void setAwayTeamShots(String awayTeamShots) {
		this.awayTeamShots = awayTeamShots;
	}
	public String getAwayTeamShotsOnTarget() {
		return awayTeamShotsOnTarget;
	}
	public void setAwayTeamShotsOnTarget(String awayTeamShotsOnTarget) {
		this.awayTeamShotsOnTarget = awayTeamShotsOnTarget;
	}
	public String getAwayTeamYellowCards() {
		return awayTeamYellowCards;
	}
	public void setAwayTeamYellowCards(String awayTeamYellowCards) {
		this.awayTeamYellowCards = awayTeamYellowCards;
	}
	public String getAwayTeamRedCards() {
		return awayTeamRedCards;
	}
	public void setAwayTeamRedCards(String awayTeamRedCards) {
		this.awayTeamRedCards = awayTeamRedCards;
	}
	public String getAwayTeamPenalties() {
		return awayTeamPenalties;
	}
	public void setAwayTeamPenalties(String awayTeamPenalties) {
		this.awayTeamPenalties = awayTeamPenalties;
	}
	public String getAwayTeamFreeKicks() {
		return awayTeamFreeKicks;
	}
	public void setAwayTeamFreeKicks(String awayTeamFreeKicks) {
		this.awayTeamFreeKicks = awayTeamFreeKicks;
	}
	public String getAwayTeamCornerKicks() {
		return awayTeamCornerKicks;
	}
	public void setAwayTeamCornerKicks(String awayTeamCornerKicks) {
		this.awayTeamCornerKicks = awayTeamCornerKicks;
	}
	public String getAwayTeam() {
		return awayTeam;
	}
	public void setAwayTeam(String awayTeam) {
		this.awayTeam = awayTeam;
	}
	
	
	
	/*private String reg_id; // 등록자 아이디
	private String reg_dt; // 등록일
	private String chg_id; // 수정자 아이디
	private String chg_dt; // 수정일
	private String user_name; // 등록자명
	*/
	

}
