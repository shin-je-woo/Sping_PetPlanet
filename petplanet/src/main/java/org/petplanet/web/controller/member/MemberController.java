package org.petplanet.web.controller.member;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.petplanet.web.auth.NaverLoginBO;
import org.petplanet.web.domain.member.MemberVO;
import org.petplanet.web.service.email.EmailService;
import org.petplanet.web.service.member.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@Autowired
	private MemberService memberService;
	@Autowired
	private EmailService emailService;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value = {"signup"}, method = RequestMethod.GET)
	public String createMemberGet() throws Exception {
		logger.info(" /signup.do URL GET method called. then forward signup.jsp.");
		return "member/signup";
	}


	@RequestMapping(value = {"signup"}, method = RequestMethod.POST)
	public String createMemberPost( @ModelAttribute("member") MemberVO vo, HttpServletRequest request) {
		memberService.addMember(vo);
		emailService.sendMail(vo, request);

		logger.info(" /signup.do URL POST method called. then createMember method executed.");
		return "email/emailsend";
	}
	@RequestMapping(value = "email_check", method = RequestMethod.GET)
	public String emailCheck(@RequestParam("userid") String userid, @RequestParam("key") String key) {
		emailService.emailCheck(userid, key);
		return "email/emailcheck";
	}
	
	@RequestMapping(value = "email_send", method = RequestMethod.GET)
	public String emailSend() {
		return "email/emailsend";
	}

	@RequestMapping(value = {"login"})
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);
		return "member/login";
	}

	@RequestMapping(value = {"login_check"})
	public String loginCheck(@ModelAttribute MemberVO vo, HttpSession session, Model model) {
		String username = memberService.loginCheck(vo, session);
		// 로그인 성공시 home페이지로 이동
		if(username != null) {
			return "home";
		} else {	// 로그인 실패시 login페이지로 되돌아감
			model.addAttribute("message", "error");
			return "member/login";
		}
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "naver/callback", method = { RequestMethod.GET, RequestMethod.POST })	
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		System.out.println(nickname);
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("username",nickname); //세션 생성
		model.addAttribute("result", apiResult);
		return "home";
	}

	@RequestMapping(value = {"logout"})
	public String logout(HttpSession session, Model model) {
		memberService.logout(session); // 세션 반환
		model.addAttribute("messasge", "logout");
		return "home";
	}
}
