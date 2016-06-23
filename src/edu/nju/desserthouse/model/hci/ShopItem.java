package edu.nju.desserthouse.model.hci;

public class ShopItem {
	private int count;
	private DessertItem dessert;
	public DessertItem getDessert() {
		return dessert;
	}
	public void setDessert(DessertItem dessert) {
		this.dessert = dessert;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
