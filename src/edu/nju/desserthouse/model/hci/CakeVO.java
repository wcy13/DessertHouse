package edu.nju.desserthouse.model.hci;

import java.util.HashMap;
import java.util.List;

import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.model.ProductCategory;

public class CakeVO {
	public List<ProductCategory> pcList;
	public HashMap<Integer,List<Dessert>> pdMap;
	
	public CakeVO(){}
	public CakeVO(List<ProductCategory> pcList, HashMap<Integer, List<Dessert>> pdMap) {
		super();
		this.pcList = pcList;
		this.pdMap = pdMap;
	}
	
}
