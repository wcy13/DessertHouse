package edu.nju.desserthouse.model.hci;

import java.util.HashMap;
import java.util.List;

import edu.nju.desserthouse.model.District;
import edu.nju.desserthouse.model.Shop;

//一个店铺列表，一个地区列表，一个地区和店铺列表的hashmap作为查找
public class ShopListVO {
	public List<Shop> shopList;
	public List<District> districtList;
	public HashMap<Integer,List<Shop>> dpMap;
	public ShopListVO(){}
	public ShopListVO(List<Shop> shopList, List<District> districtList, HashMap<Integer, List<Shop>> dpMap) {
		super();
		this.shopList = shopList;
		this.districtList = districtList;
		this.dpMap = dpMap;
	}
	
}
