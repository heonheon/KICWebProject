package model;

public class WorkoutMenu {
	String aero;
	String woType;
	String woName;
	public String getAero() {
		return aero;
	}
	public void setAero(String aero) {
		this.aero = aero;
	}
	public String getWoType() {
		return woType;
	}
	public void setWoType(String woType) {
		this.woType = woType;
	}
	public String getWoName() {
		return woName;
	}
	public void setWoName(String woName) {
		this.woName = woName;
	}
	@Override
	public String toString() {
		return "WorkoutMenu [aero=" + aero + ", woType=" + woType + ", woName=" + woName + "]";
	}
}
