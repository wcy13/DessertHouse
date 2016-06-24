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
		String id;
		if(d.isCake())
		{
			id = d.getDid() +"-"+ d.getMount()+"-" + d.getJ();
		}
		else
		{
			id = String.valueOf(d.getDid());
		}
		ShopItem item= map.get(id);
		if(item == null){
			item = new ShopItem();
			item.setDessert(d);
			item.setCount(count);
			map.put(id,item);
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
			s +="name: "+ map.get(key).getDessert().getName()+" 夹层: " +map.get(key).getDessert().getJ() +" count : "+map.get(key).getCount() +"磅数: "+map.get(key).getDessert().getMount()+"\n";
		}
		return s;
	} 
}
