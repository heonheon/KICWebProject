package model;

import java.util.Date;

public class DietInfo {
	int num;
	String meal;
	String foodName;
	double foodWeight;
	double carbo;
	double protine;
	double fat;
	double calorie;
	String id;
	Date mealDate;
	String mealType;

	public String getMealType() {
		switch(meal) {
		case "1" : return "아침";
		case "2" : return "점심";
		case "3" : return "저녁";
		case "4" : return "간식";
		}
		
		return mealType;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMeal() {
		return meal;
	}

	public void setMeal(String meal) {
		this.meal = meal;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public double getFoodWeight() {
		return foodWeight;
	}

	public void setFoodWeight(double foodWeight) {
		this.foodWeight = foodWeight;
	}

	public double getCarbo() {
		return carbo;
	}

	public void setCarbo(double carbo) {
		this.carbo = carbo;
	}

	public double getProtine() {
		return protine;
	}

	public void setProtine(double protine) {
		this.protine = protine;
	}

	public double getFat() {
		return fat;
	}

	public void setFat(double fat) {
		this.fat = fat;
	}

	public double getCalorie() {
		return calorie;
	}

	public void setCalorie(double calorie) {
		this.calorie = calorie;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getMealDate() {
		return mealDate;
	}

	public void setMealDate(Date mealDate) {
		this.mealDate = mealDate;
	}

	@Override
	public String toString() {
		return "DietInfo [num=" + num + ", meal=" + meal + ", foodName=" + foodName + ", foodWeight=" + foodWeight
				+ ", carbo=" + carbo + ", protine=" + protine + ", fat=" + fat + ", calorie=" + calorie + ", id=" + id
				+ ", mealDate=" + mealDate + ", mealType=" + mealType + "]";
	}
}
