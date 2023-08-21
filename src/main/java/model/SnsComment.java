package model;

import java.util.Date;

public class SnsComment {
	int ser;
	int num;
	String id;
	String content;
	Date commentDate;
	
	public int getSer() {
		return ser;
	}
	public void setSer(int ser) {
		this.ser = ser;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	@Override
	public String toString() {
		return "SnsComment [ser=" + ser + ", num=" + num + ", id=" + id + ", content=" + content + ", commentDate="
				+ commentDate + "]";
	}
}
