import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class test {
	static Connection conn = null;
	static PreparedStatement stmt = null;
	static ResultSet rs = null;
	
	public static void main(String[] args) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String dbUrl = "jdbc:mysql://localhost:3306/web2012?useUnicode=true& useUnicode=true&characterEncoding=euc_kr";
		String dbUser = "web";
		String dbPassword = "asdf";
	
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			
			while(true) {
				getKeyword();
				Thread.sleep(60000);		// 1분마다 검색어 갱신
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		    if (rs != null) try{rs.close();} catch(SQLException e) {}
		    if (stmt != null) try{stmt.close();} catch(SQLException e) {}
		    if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
    }
    
    public static void getKeyword() {
        try {
        	String apiKey = "7917d5df6bb7d982057f6bb5ee3658f5";
 //          String url = "http://openapi.naver.com/search?key=" + apiKey + "&query=nexearch&target=rank";	// 네이버 검색 api
        	String url = "http://apis.daum.net/socialpick/search?category=c";								// 다음 소셜톡 검색 api
            String keyword;
            int value;
            
            // 위의 url로 request를 던지면 xml형식의 결과를 반환한다
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = builderFactory.newDocumentBuilder();
            Document doc = builder.parse(url);
            Element root = doc.getDocumentElement();
            // 취득한 xml형식의 결과에서 실시간 검색어와 검색수를 뽑아온다
//            NodeList itemList = root.getElementsByTagName("K");						// 네이버 검색 api 사용시
//            NodeList valueList = root.getElementsByTagName("V");						// 다음 소셜톡 검색 api 사용시
            NodeList itemList = root.getElementsByTagName("keyword");
            NodeList valueList = root.getElementsByTagName("rank_diff");
            
            for (int i = 0; i < itemList.getLength(); i++) {
                Element itemElement = (Element) itemList.item(i);
                Element valueElement = (Element) valueList.item(i);

                keyword = itemElement.getFirstChild().getNodeValue();
                value = Integer.parseInt(valueElement.getFirstChild().getNodeValue());
                
                // 실시간 검색어와 검색수를 각각 keyword와 value에 넣는다
               // System.out.println(keyword + value);
                // 확인차 콘솔에 출력
                
                setData(keyword, value);
                // 데이터 베이스에 실시간 검색어와 검색수를 삽입하는 메소드
            }
            
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParserConfigurationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SAXException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    public static void setData(String keyword, int value) {
    	try {
    		String temp="";
    		stmt = conn.prepareStatement("select keyword from keyword where keyword = ?");
    		stmt.setString(1, keyword);
    		rs = stmt.executeQuery();
    		if(rs.next())
    			temp = rs.getString(1);			// 삽입하려는 키워드가 이미 테이블에 있는지 확인
    		
    		stmt.close();
    		
    		if(!(temp.equals(keyword))) {		// 테이블에 그 키워드가 없을때는 키워드와 검색수 insert
				stmt = conn.prepareStatement("insert into keyword values (null, ?, ?, ?, null)");
				stmt.setString(1, keyword);
				stmt.setInt(2, value);
				stmt.setString(3, "search");
			
				stmt.executeUpdate();
    		} else {							// 있을때는 검색수만 더해줌
    			stmt = conn.prepareStatement("update keyword set weight = weight + ?");
				stmt.setInt(1, value);
			
				stmt.executeUpdate();
    		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    /*
    public static keywordGarbageCollector() {
    	stmt = conn.prepareStatement("SELECT COUNT(*) from ")
    }
    */
}