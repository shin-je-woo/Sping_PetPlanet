package org.petplanet.web.domain.abandon;

public class AbandonVO {
	private String desertionNo; // 유기번호 like id
	private String happenDt; // 접수일
	private String happenPlace; // 발견장소
	private String kindCd; // 품종
	private String colorCd; // 색상
	private String age; // 나이
	private String weight; // 체중
	private String noticeNo; // 공고번호
	private String noticeSdt; // 공고시작일
	private String noticeEdt; // 공고종료일
	private String filename; // ThumbImage
	private String popfile; // Image
	private String processState; // 상태
	private String sexCd; // 성별
	private String specialMark; // 특징
	private String careNm; // 보호소이름
	private String careTel; // 보호소전화번호
	private String careAddr; // 보호소장소
	public String getDesertionNo() {
		return desertionNo;
	}
	public void setDesertionNo(String desertionNo) {
		this.desertionNo = desertionNo;
	}
	public String getHappenDt() {
		return happenDt;
	}
	public void setHappenDt(String happenDt) {
		this.happenDt = happenDt;
	}
	public String getHappenPlace() {
		return happenPlace;
	}
	public void setHappenPlace(String happenPlace) {
		this.happenPlace = happenPlace;
	}
	public String getKindCd() {
		return kindCd;
	}
	public void setKindCd(String kindCd) {
		this.kindCd = kindCd;
	}
	public String getColorCd() {
		return colorCd;
	}
	public void setColorCd(String colorCd) {
		this.colorCd = colorCd;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeSdt() {
		return noticeSdt;
	}
	public void setNoticeSdt(String noticeSdt) {
		this.noticeSdt = noticeSdt;
	}
	public String getNoticeEdt() {
		return noticeEdt;
	}
	public void setNoticeEdt(String noticeEdt) {
		this.noticeEdt = noticeEdt;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getPopfile() {
		return popfile;
	}
	public void setPopfile(String popfile) {
		this.popfile = popfile;
	}
	public String getProcessState() {
		return processState;
	}
	public void setProcessState(String processState) {
		this.processState = processState;
	}
	public String getSexCd() {
		return sexCd;
	}
	public void setSexCd(String sexCd) {
		this.sexCd = sexCd;
	}
	public String getSpecialMark() {
		return specialMark;
	}
	public void setSpecialMark(String specialMark) {
		this.specialMark = specialMark;
	}
	public String getCareNm() {
		return careNm;
	}
	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}
	public String getCareTel() {
		return careTel;
	}
	public void setCareTel(String careTel) {
		this.careTel = careTel;
	}
	public String getCareAddr() {
		return careAddr;
	}
	public void setCareAddr(String careAddr) {
		this.careAddr = careAddr;
	}
	@Override
	public String toString() {
		return "AbandonVO [desertionNo=" + desertionNo + ", happenDt=" + happenDt + ", happenPlace=" + happenPlace
				+ ", kindCd=" + kindCd + ", colorCd=" + colorCd + ", age=" + age + ", weight=" + weight + ", noticeNo="
				+ noticeNo + ", noticeSdt=" + noticeSdt + ", noticeEdt=" + noticeEdt + ", filename=" + filename
				+ ", popfile=" + popfile + ", processState=" + processState + ", sexCd=" + sexCd + ", specialMark="
				+ specialMark + ", careNm=" + careNm + ", careTel=" + careTel + ", careAddr=" + careAddr + "]";
	}
	
}
