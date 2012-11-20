import java.awt.List;
import java.util.Arrays;
import com.sun.xml.internal.ws.util.StringUtils;
import java.util.*;


public class Users implements java.io.Serializable {
		private static final long serialVersionUid = 2193897931951340673L;
		private static final String [] countryNames  = { "kr" , "Ame" , "Ger" , "Jap" , "Chi" };
		private static final String [] hobbys   =  { "sports" , "book" , "sing" , "love" ,"fassing" , "photo" ,"gambling"}; 
		private static final String [][] genders = { {"M" ,"남성"} , {"W","여성"}};

		private String name ;
		private String id ;
		private String passoword;
		private String email ;
		private String country ;
		private String gender;
		private String hobby;
			
			public Users () { }  // java bean 의 조건으로 가려 노았습니다!!
		
			public Users(String name , String id , String passoword, String email , String country , String gender , String hobby)
			{
				super();
				this.name = name;
				this.id = id;
				this.passoword = passoword;
				this.email = email;
				this.country = country ;
				this.gender = gender ;
				this.hobby = hobby;
			}

			public String getName() {
				return name;
			}

			public void setName(String name) {
				this.name = name;
			}

			public String getId() {
				return id;
			}

			public void setId(String id) {
				this.id = id;
			}

			public String getPassoword() {
				return passoword;
			}

			public void setPassoword(String passoword) {
				this.passoword = passoword;
			}

			public String getEmail() {
				return email;
			}

			public void setEmail(String email) {
				this.email = email;
			}

			public String getCountry() {
				return country;
			}

			public void setCountry(String country) {
				this.country = country;
			}

			public String getGender() {
				return gender;
			}

			public void setGender(String gender) {
				this.gender = gender;
			}

			public String getHobby() {
				return hobby;
			}

			public void setHobby(String hobby) {
				this.hobby = hobby;
			}

			public static long getSerialversionuid() {
				return serialVersionUid;
			}

			public static String[] getCountrynames() {
				return countryNames;
			}

			public static String[] getHobbys() {
				return hobbys;
			}

			public static String[][] getGenders() {
				return genders;
			}
			
			public String genderGenderStr() {
				if (gender.equals("M"))
				{
					return "남성" ;
				}
				else {
					return "여성";
				}
				}
			
			public String checkCountry (String countryName)
			{
				return (countryNames.equals(country)) ? "selected": "";
			}
			public List<String> gethobbyList()
			{
				List hobbyList = null;
				if(hobby != null && hobby.length()>0)
				{
					hobbyList = Arrays.asList(StringUtils.split(hobby, ","));
				}
				return hobbyList;
			
			}
			public  String checkgetGenders(String genderName) {
				return ( genderName.equals(gender)) ? "checked" : "";
				
			}
}
