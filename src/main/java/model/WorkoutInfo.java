package model;

import java.util.Date;

public class WorkoutInfo {
	int num;
	String id;
	String wocode;
	Date wodate;
	double paraone;
	double paratwo;
	double parathr;
	String woName ;
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
	public String getWocode() {
		return wocode;
	}
	public void setWocode(String wocode) {
		this.wocode = wocode;
	}
	public Date getWodate() {
		return wodate;
	}
	public void setWodate(Date wodate) {
		this.wodate = wodate;
	}
	public double getParaone() {
		return paraone;
	}
	public void setParaone(double paraone) {
		this.paraone = paraone;
	}
	public double getParatwo() {
		return paratwo;
	}
	public void setParatwo(double paratwo) {
		this.paratwo = paratwo;
	}
	public double getParathr() {
		return parathr;
	}
	public void setParathr(double parathr) {
		this.parathr = parathr;
	}
	public String getWoName() {
		return woName;
	}
	public void setWoName(String woName) {
		this.woName = woName;
	}
	@Override
	public String toString() {
		return "WorkoutInfo [num=" + num + ", id=" + id + ", wocode=" + wocode + ", wodate=" + wodate + ", paraone="
				+ paraone + ", paratwo=" + paratwo + ", parathr=" + parathr + ", woName=" + woName + "]";
	}
}
