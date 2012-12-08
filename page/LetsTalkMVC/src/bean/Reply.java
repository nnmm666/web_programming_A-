package bean;

import java.io.Serializable;

public class Reply implements Serializable {
	private static final long serialVersionUID = -1029175721547201384L;
	
	private int reply_id;
	private int opinion_id;
	private String content;
	private String writer;
	private String date;
	
	public Reply() {}
	
	public Reply(int reply_id, int opinion_id, String content, String writer,
			String date) {
		super();
		this.reply_id = reply_id;
		this.opinion_id = opinion_id;
		this.content = content;
		this.writer = writer;
		this.date = date;
	}

	public Reply(int opinion_id, String content, String writer) {
		super();
		this.opinion_id = opinion_id;
		this.content = content;
		this.writer = writer;
	}

	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public int getOpinion_id() {
		return opinion_id;
	}

	public void setOpinion_id(int opinion_id) {
		this.opinion_id = opinion_id;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
