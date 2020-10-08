package org.petplanet.web.service.abandon;

import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.petplanet.web.domain.abandon.AbandonVO;
import org.petplanet.web.page.Pagination;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


@Service
public class AbandonServiceImpl implements AbandonService {
	
	private static final String REQUEST_URL = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic";
	private static final String SERVICE_KEY = "tgvacS0zUDSRYggMqk3qLDoMadwRx5gcOE3khPBMwdFrB%2BFn%2F703ZSIt4gd1tTWG2r6x3WqvaK%2BQWw9JC8%2BrMQ%3D%3D";
	private static final String NUM_OF_ROWS = Integer.toString(9);
	
	@Override
	public List<AbandonVO> listAbandon(Pagination pagination) {
		// TODO Auto-generated method stub
		List<AbandonVO> voList = new LinkedList<>();
		voList = getListFromXml(pagination);
		return voList;
	}
	
	
	private static List<AbandonVO> getListFromXml(Pagination pagination) {
		List<AbandonVO> voList = new LinkedList<>();
		try{
			String url = REQUEST_URL + "?pageNo=" + pagination.getPage() + "&numOfRows=" + NUM_OF_ROWS + "&ServiceKey=" + SERVICE_KEY;

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// root tag 
			doc.getDocumentElement().normalize();
//			System.out.println("Root element :" + doc.getDocumentElement().getNodeName());

			// 파싱할 tag
			NodeList nList = doc.getElementsByTagName("item");
			//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
//			System.out.println(nList.getLength());
			for(int temp = 0; temp < nList.getLength(); temp++){
				Node nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE){
					AbandonVO vo = new AbandonVO(); 
					Element eElement = (Element) nNode;
					vo.setDesertionNo(getTagValue("desertionNo", eElement));
					vo.setAge(getTagValue("age", eElement));
					vo.setCareAddr(getTagValue("careAddr", eElement));
					vo.setCareNm(getTagValue("careNm", eElement));
					vo.setCareTel(getTagValue("careTel", eElement));
					vo.setColorCd(getTagValue("colorCd", eElement));
					vo.setHappenDt(parseDate(getTagValue("happenDt", eElement)));
					vo.setHappenPlace(getTagValue("happenPlace", eElement));
					vo.setKindCd(getTagValue("kindCd", eElement));
					vo.setNoticeNo(getTagValue("noticeNo", eElement));
					vo.setNoticeEdt(parseDate(getTagValue("noticeEdt", eElement)));
					vo.setNoticeSdt(parseDate(getTagValue("noticeSdt", eElement)));
					vo.setFilename(getTagValue("filename", eElement));
					vo.setPopfile(getTagValue("popfile", eElement));
					vo.setProcessState(getTagValue("processState", eElement));
					vo.setSexCd(parseSex(getTagValue("sexCd", eElement)));
					vo.setSpecialMark(getTagValue("specialMark", eElement));
					vo.setWeight(getTagValue("weight", eElement));
					voList.add(vo);
					
//					System.out.println();
//					System.out.println("######################");
//					System.out.println("careAddr  : " + vo.getCareAddr());
//					System.out.println("kindCd  : " + vo.getKindCd());
//					System.out.println("noticeEdt : " + vo.getNoticeEdt());
//					System.out.println("processState  : " + vo.getProcessState());
//					System.out.println("weight  : " + vo.getWeight());
//					System.out.println("filename  : " + vo.getFilename());
				}	// for end
			}	// if end

		} catch (Exception e){	
			e.printStackTrace();
		}	// try~catch end
		return voList;
	}
	
	// tag값의 정보를 가져오는 메소드
		private static String getTagValue(String tag, Element eElement) {
			NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			Node nValue = (Node) nlList.item(0);
			if(nValue == null) 
				return null;
			return nValue.getNodeValue();
		}
		
		private static String parseDate(String fromString) throws ParseException {
			String toString = fromString.substring(0,4) + "-" + fromString.substring(4,6) + "-" + fromString.substring(6);
			return toString;
		}
		
		private static String parseSex(String fromString) throws ParseException {
			String toString = "";
			if(fromString.equals("M")) {
				toString = "수컷";
			} else {
				toString = "암컷";
			}
			return toString;
		}

}
