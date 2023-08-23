package model;

import java.util.Date;

public class SnsContent {
	int num;
	String id;
	String photo1;
	String photo2;
	String photo3;
	String photo4;
	String photo5;
	String content;
	Date contentDate;
	int heart;
	
	public int getHeart() {
		return heart;
	}
	public void setHeart(int heart) {
		this.heart = heart;
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
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public String getPhoto2() {
		return photo2;
	}
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	public String getPhoto3() {
		return photo3;
	}
	public void setPhoto3(String photo3) {
		this.photo3 = photo3;
	}
	public String getPhoto4() {
		return photo4;
	}
	public void setPhoto4(String photo4) {
		this.photo4 = photo4;
	}
	public String getPhoto5() {
		return photo5;
	}
	public void setPhoto5(String photo5) {
		this.photo5 = photo5;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getContentDate() {
		return contentDate;
	}
	public void setContentDate(Date contentDate) {
		this.contentDate = contentDate;
	}
	@Override
	public String toString() {
		return "SnsContent [num=" + num + ", id=" + id + ", photo1=" + photo1 + ", photo2=" + photo2 + ", photo3="
				+ photo3 + ", photo4=" + photo4 + ", photo5=" + photo5 + ", content=" + content + ", contentDate="
				+ contentDate + ", heart=" + heart + "]";
	}
	
	
	
}
