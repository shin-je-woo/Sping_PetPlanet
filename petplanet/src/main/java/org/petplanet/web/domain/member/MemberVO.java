package org.petplanet.web.domain.member;

public class MemberVO {
	private String userid;
	private String passwd;
	private String username;
	private String nickname;
	private String email;
	private String emailHash;
	private boolean emailCheck;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailHash() {
		return emailHash;
	}
	public void setEmailHash(String emailHash) {
		this.emailHash = emailHash;
	}
	public boolean isEmailCheck() {
		return emailCheck;
	}
	public void setEmailCheck(boolean emailCheck) {
		this.emailCheck = emailCheck;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", passwd=" + passwd + ", username=" + username + ", nickname=" + nickname
				+ ", email=" + email + ", emailHash=" + emailHash + ", emailCheck=" + emailCheck + "]";
	}
}
