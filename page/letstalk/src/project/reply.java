package project;

public class reply implements java.io.Serializable{
	private static final long serialVersionUID = 7116948049833402318L;
	

	private String opinion_id ="";
	private String content = "";
	private String writer = "";
	
	public reply(String opinion_id, String writer, String content) {

		this.opinion_id = opinion_id;
		this.content =content;
		this.writer = writer;

	}
	public String getOpinion_id() {
		return opinion_id;
	}

	public void setOpinion_id(String opinion_id) {
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


}
