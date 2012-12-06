package project;

public class Write implements java.io.Serializable{
	private int id;
	private int keyword_id;
	private String writer;
	private String content;
	private String date;
	private String photo;
	private String address;

	public Write(){}
	
	public void setID(int id){this.id=id;}
	public int getID(){return id;}
	public void setKeyword_id(int keyword_id){this.keyword_id=keyword_id;}
	public int getKeyword_id(){return keyword_id;}
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