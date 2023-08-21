package model;

import java.util.Date;

public class BodyInfo {
	int num;
	String id;
	double bmi;
	double bodyheight;
	double bodyweight;
	double bodyfat;
	double muscul;
	Date bodyDate;
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
	public double getBmi() {
		return bmi;
	}
	public void setBmi(double bmi) {
		this.bmi = bmi;
	}
	public double getBodyheight() {
		return bodyheight;
	}
	public void setBodyheight(double bodyheight) {
		this.bodyheight = bodyheight;
	}
	public double getBodyweight() {
		return bodyweight;
	}
	public void setBodyweight(double bodyweight) {
		this.bodyweight = bodyweight;
	}
	public double getBodyfat() {
		return bodyfat;
	}
	public void setBodyfat(double bodyfat) {
		this.bodyfat = bodyfat;
	}
	public double getMuscul() {
		return muscul;
	}
	public void setMuscul(double muscul) {
		this.muscul = muscul;
	}
	public Date getBodyDate() {
		return bodyDate;
	}
	public void setBodyDate(Date bodyDate) {
		this.bodyDate = bodyDate;
	}
	@Override
	public String toString() {
		return "BodyInfo [num=" + num + ", id=" + id + ", bmi=" + bmi + ", bodyheight=" + bodyheight + ", bodyweight="
				+ bodyweight + ", bodyfat=" + bodyfat + ", muscul=" + muscul + ", bodyDate=" + bodyDate + "]";
	}
}
