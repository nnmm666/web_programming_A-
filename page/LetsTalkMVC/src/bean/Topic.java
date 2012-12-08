package bean;

import java.io.Serializable;

public class Topic implements Serializable {
	private static final long serialVersionUID = -3839155246873888008L;
	
	private int topic_id;
	private int keyword_id;
	private String content;
	private String writer;
	private int pros;
	private int cons;
	private String date;
	private String photo;

	public Topic() {}
	
	public Topic(int keyword_id, String content, String writer, String photo) {
		super();
		this.keyword_id = keyword_id;
		this.content = content;
		this.writer = writer;
		this.photo = photo;
	}

	public Topic(int topic_id, int keyword_id, String content,
			String writer, int pros, int cons, String date, String photo) {
		super();
		this.topic_id = topic_id;
		this.keyword_id = keyword_id;
		this.content = content;
		this.writer = writer;
		this.pros = pros;
		this.cons = cons;
		this.date = date;
		this.photo = photo;
	}

	public int getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}

	public int getKeyword_id() {
		return keyword_id;
	}

	public void setKeyword_id(int keyword_id) {
		this.keyword_id = keyword_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getPros() {
		return pros;
	}

	public void setPros(int pros) {
		this.pros = pros;
	}

	public int getCons() {
		return cons;
	}

	public void setCons(int cons) {
		this.cons = cons;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
