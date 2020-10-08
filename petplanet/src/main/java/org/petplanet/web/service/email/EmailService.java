package org.petplanet.web.service.email;

import javax.servlet.http.HttpServletRequest;
import org.petplanet.web.domain.member.MemberVO;

public interface EmailService {
	String createHash();
	String getKey(boolean lowerCheck, int size);
	void sendMail(MemberVO memberVO, HttpServletRequest request);
	void emailCheck(String userid, String key);
}
