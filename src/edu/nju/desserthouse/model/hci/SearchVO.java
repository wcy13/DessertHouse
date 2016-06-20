package edu.nju.desserthouse.model.hci;

import java.util.List;

import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.model.Shop;

public class SearchVO {
	public List<Dessert> dessertList;
	public List<Shop> shopList;
	
	public SearchVO(){}
	public SearchVO(List<Dessert> dessertList, List<Shop> shopList) {
		super();
		this.dessertList = dessertList;
		this.shopList = shopList;
	}
	
}
