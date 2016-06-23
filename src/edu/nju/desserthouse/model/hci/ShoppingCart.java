package edu.nju.desserthouse.model.hci;

import java.util.LinkedHashMap;
import java.util.Map;

import edu.nju.desserthouse.model.Dessert;

public class ShoppingCart {
	private Map<String,ShopItem> map=new LinkedHashMap<String, ShopItem>();

	public Map<String,ShopItem> getMap() {
		return map;
	}

	public void setMap(Map<String,ShopItem> map) {
		this.map = map;
	}
	public void add(DessertItem d ,int count){
		System.out.println("add start");
		System.out.println(d.getDid() + " : "+d.getName() + " count:" + count);
		ShopItem item= map.get(String.valueOf(d.getDid()));
		if(item == null){
			item = new ShopItem();
			item.setDessert(d);
			item.setCount(count);
			map.put(Integer.toString(d.getDid()),item); 
		}
		else
		{
			System.out.println("已有数目: " + item.getCount());
			int c = item.getCount() + count;
			item.setCount(c); 
		}
		System.out.println("add end");
	}
	public String show(){
		String s = "";
		for(String key : map.keySet())
		{
			s +="name: "+ map.get(key).getDessert().getName() +" count : "+map.get(key).getCount() +"\n";
		}
		return s;
	} 
}
