package bean;

import java.io.Serializable;

public class Keyword implements Serializable {
	private static final long serialVersionUID = -260356019898383055L;
	
	private int keyword_id;
	private String keyword;
	private int weight;
	private String type;
	private String date;
	
	public Keyword() {}
	
	public Keyword(int keyword_id, String keyword, int weight, String type, String date) {
		super();
		this.keyword_id = keyword_id;
		this.keyword = keyword;
		this.weight = weight;
		this.type = type;
		this.date = date;
	}

	public int getKeyword_id() {
		return keyword_id;
	}

	public void setKeyword_id(int keyword_id) {
		this.keyword_id = keyword_id;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
