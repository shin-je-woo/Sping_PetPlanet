package org.petplanet.web.service.email;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.petplanet.web.controller.member.MemberController;
import org.petplanet.web.domain.member.MemberVO;
import org.petplanet.web.persistence.member.MemberDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {
	@Inject
	JavaMailSender mailSender; // 메일 발송 객체(root-context.xml에 빈 등록 완료)
	
	@Autowired
	MemberDAO memberDAO;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private static final String host = "http://localhost:8080";

//	@Override
//	public void sendMail(EmailVO vo) {
//		try {
//			MimeMessage msg = mailSender.createMimeMessage();
//			// 이메일 수신자
//			msg.addRecipient(RecipientType.TO, new InternetAddress(vo.getReceiveMail()));
//			// 이메일 발신자
//			msg.addFrom(new InternetAddress[] {
//					new InternetAddress(vo.getSenderMail(), vo.getSenderName())
//			});
//			// 이메일 제목
//			msg.setSubject(vo.getSubject(), "utf-8");
//			// 이메일 본문
//			msg.setText(vo.getMessage(), "utf-8");
//			mailSender.send(msg); // 이메일 전송
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	// 이메일 난수 만드는 메서드
	@Override
	public String createHash() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	@Override
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return createHash();
	}

	// 회원가입 발송 이메일(인증키 발송)
	@Override
	public void sendMail(MemberVO memberVO, HttpServletRequest request) {
//		String content = "PetPlane 인증메일입니다.<a href='" + host + "request.getContextPath()\r\n"
//				+ "+ \"/member/check_update?memberId=\" + memberId + \"&memberKey=\" + memberKey + \"'>인증하기</a>";
		
		String key = getKey(false, 20);
		memberVO.setEmailHash(key);
		logger.info(memberVO.getUserid());
		logger.info(memberVO.getEmailHash());
		//Map<String, String> parameters = new HashMap<String, String>();
		//parameters.put("userid", memberVO.getUserid());
		//parameters.put("key", memberVO.getEmailHash());
		memberDAO.getKey(memberVO);
		String content = "<h2>안녕하세요 PetPlanet입니다!</h2><br><br>" 
				+ "<h3>" + memberVO.getUserid() + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href=" + host + request.getContextPath() + "/member/email_check?userid="
				+ memberVO.getUserid() +"&key="+memberVO.getEmailHash()+"'>인증하기</a></p></html>";


		try {
			MimeMessage msg = mailSender.createMimeMessage();
			// 이메일 수신자
			msg.addRecipient(RecipientType.TO, new InternetAddress(memberVO.getEmail()));
			// 이메일 발신자
			msg.addFrom(new InternetAddress[] { new InternetAddress("shinjw0926@gmail.com", "PetPlanet 인증메일") });
			// 이메일 제목
			msg.setSubject("PetPlanet 인증메일입니다.", "utf-8");
			// 이메일 본문
			msg.setText(content, "utf-8", "html");
			mailSender.send(msg); // 이메일 전송
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void emailCheck(String userid, String key) {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("userid", userid);
		parameters.put("key", key);
		memberDAO.alterEmailCheck(parameters);
	}

}
