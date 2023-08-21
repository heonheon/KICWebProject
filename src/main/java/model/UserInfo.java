package model;

import java.util.Date;

public class UserInfo {
	String id;
	String email;
	String name;
	String password;
	Date signDate;
	int gender;
	String bodyheight;
	String bodyweight;
	String bodyfat;
	String muscul;
	String bmi;
	String picture;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getSignDate() {
		return signDate;
	}
	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getBodyheight() {
		return bodyheight;
	}
	public void setBodyheight(String bodyheight) {
		this.bodyheight = bodyheight;
	}
	public String getBodyweight() {
		return bodyweight;
	}
	public void setBodyweight(String bodyweight) {
		this.bodyweight = bodyweight;
	}
	public String getBodyfat() {
		return bodyfat;
	}
	public void setBodyfat(String bodyfat) {
		this.bodyfat = bodyfat;
	}
	public String getMuscul() {
		return muscul;
	}
	public void setMuscul(String muscul) {
		this.muscul = muscul;
	}
	public String getBmi() {
		return bmi;
	}
	public void setBmi(String bmi) {
		this.bmi = bmi;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "Id [id=" + id + ", email=" + email + ", name=" + name + ", password=" + password + ", signDate="
				+ signDate + ", gender=" + gender + ", bodyheight=" + bodyheight + ", bodyweight=" + bodyweight
				+ ", bodyfat=" + bodyfat + ", muscul=" + muscul + ", bmi=" + bmi + ", picture=" + picture + "]";
	}
}
