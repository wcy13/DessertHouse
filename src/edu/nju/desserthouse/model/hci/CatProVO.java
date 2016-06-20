package edu.nju.desserthouse.model.hci;

import java.util.HashMap;
import java.util.List;

import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.model.ProductCategory;
//下述均除去蛋糕相关数据
//所有商品分类
//所有商品列表
//商品分类和商品的hashmap
public class CatProVO {
	public List<ProductCategory> productCategoryList;
	public List<Dessert> dessertList;
	public HashMap<Integer,List<Dessert>> cpMap;
	public CatProVO(){}
	public CatProVO(List<ProductCategory> productCategoryList, List<Dessert> dessertList,
			HashMap<Integer, List<Dessert>> cpMap) {
		super();
		this.productCategoryList = productCategoryList;
		this.dessertList = dessertList;
		this.cpMap = cpMap;
	}
	
}
