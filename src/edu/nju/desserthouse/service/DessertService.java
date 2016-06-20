package edu.nju.desserthouse.service;

import java.util.List;

import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.model.hci.CategoryShowVO;

public interface DessertService {
	/*
	 * 增加一个商品
	 */
	public void createDessert(Dessert dessert);
	/*
	 * 删除一个商品
	 */
	public void deleteDessert(int id);
	
	/*
	 * 根据id返回商品信息
	 */
	public Dessert findDessert(int id);
	
	
	/*
	 * 根据id更新商品信息
	 */
	public void updateByDessertid(Dessert dessert);
	/*
	 * 获得所有商品信息
	 */
	public List<Dessert> getAllDessertList();
	
	/***************************HCI相关***********************************/
	//获得商品分类
	public CategoryShowVO getAllCategory();
	//获得某商品分类下的商品列表
	public List<Dessert> getCategoryRelatedDesserts(int pcid);
	
}
