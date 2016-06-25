package edu.nju.desserthouse.model.hci;

public class ShopItem {
	private int count;
	private DessertItem dessert;
	private String itemId;
	public double getTotalPrice(){
		return dessert.getPrice() * count;
	}
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
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
}
