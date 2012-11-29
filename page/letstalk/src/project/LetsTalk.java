package project;

public class LetsTalk {
	private int id;
	private int keywordID;
	private String writer;
	private String content;
	private String date;
	private String photo;
	private String address;

	public LetsTalk(){}
	
	public void setID(int id){this.id=id;}
	public int getID(){return id;}
	public void setKeywordID(int keywordID){this.keywordID=keywordID;}
	public int getKeywordID(){return keywordID;}
	public void setWriter(String writer){this.writer=writer;}
	public String getWriter(){return writer;}
	public void setContent(String content){this.content=content;}
	public String getContent(){return content;}
	public void setDate (String date){this.date=date;}
	public String getDate(){return date;}
	public void setPhoto(String photo){this.photo=photo;}
	public String getPhoto(){return photo;}
	public void setAddress(String address){this.address=address;}
	public String getAddress(){return address;}
}