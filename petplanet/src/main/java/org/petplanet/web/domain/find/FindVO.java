package org.petplanet.web.domain.find;

import org.springframework.web.multipart.MultipartFile;

public class FindVO {
	private int find_id;
	private String title;
	private String animaltype;
	private String gender;
	private String phone;
	private String lost_date;
	private String lost_description;
	private MultipartFile image; //첨부파일
	private String image_url;
	private String map_lat; // 맵 위도
	private String map_lng; // 맵 경도
	private String map_address; // 맵 주소
	public int getFind_id() {
		return find_id;
	}
	public void setFind_id(int find_id) {
		this.find_id = find_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAnimaltype() {
		return animaltype;
	}
	public void setAnimaltype(String animaltype) {
		this.animaltype = animaltype;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLost_date() {
		return lost_date;
	}
	public void setLost_date(String lost_date) {
		this.lost_date = lost_date;
	}
	public String getLost_description() {
		return lost_description;
	}
	public void setLost_description(String lost_description) {
		this.lost_description = lost_description;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getMap_lat() {
		return map_lat;
	}
	public void setMap_lat(String map_lat) {
		this.map_lat = map_lat;
	}
	public String getMap_lng() {
		return map_lng;
	}
	public void setMap_lng(String map_lng) {
		this.map_lng = map_lng;
	}
	public String getMap_address() {
		return map_address;
	}
	public void setMap_address(String map_address) {
		this.map_address = map_address;
	}
	
	@Override
	public String toString() {
		return "FindVO [find_id=" + find_id + ", title=" + title + ", animaltype=" + animaltype + ", gender=" + gender
				+ ", phone=" + phone + ", lost_date=" + lost_date + ", lost_description=" + lost_description
				+ ", image=" + image + ", image_url=" + image_url + ", map_lat=" + map_lat + ", map_lng=" + map_lng
				+ ", map_address=" + map_address + "]";
	}
}
