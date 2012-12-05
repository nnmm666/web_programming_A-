package bean;
import java.io.Serializable;
import java.util.List;


public class Opinion implements Serializable {
	private static final long serialVersionUID = -4595483688249147779L;

	private int opinion_id;
	private int topic_id;
	private String content;
	private String writer;
	private String position;
	private int pros;
	private int cons;
	private String date;
	private List<Reply> replies = null;
	
	public Opinion() {}
	
	public Opinion(int opinion_id, int topic_id, String content, String writer,
			String position, int pros, int cons, String date,
			List<Reply> replies) {
		super();
		this.opinion_id = opinion_id;
		this.topic_id = topic_id;
		this.content = content;
		this.writer = writer;	
		this.position = position;
		this.pros = pros;
		this.cons = cons;
		this.date = date;
		this.replies = replies;
	}

	public int getOpinion_id() {
		return opinion_id;
	}

	public void setOpinion_id(int opinion_id) {
		this.opinion_id = opinion_id;
	}

	public int getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
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

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
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
	
	public List<Reply> getReplies() {
		return replies;
	}

	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}
	
}
