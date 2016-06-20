package edu.nju.desserthouse.service;

import java.util.List;

import edu.nju.desserthouse.model.Shop;
import edu.nju.desserthouse.model.hci.CatProVO;
import edu.nju.desserthouse.model.hci.ShopListVO;

public interface ShopService {
	/*
	 * 增加一个店面
	 */
	public void createShop(Shop shop);
	/*
	 * 删除一个店面
	 */
	public void deleteShop(int id);
	
	/*
	 * 根据id返回店面信息
	 */
	public Shop findShop(int id);
	
	
	/*
	 * 根据id更新店面信息
	 */
	public void updateByShopid(Shop shop);
	/*
	 * 获得所有店面信息
	 */
	public List<Shop> getAllShopList();
	/****************HCI********************/
	//点击门店时，获得所有地区、所有门店、地区和门店的映射关系
	public ShopListVO getShopListVO();
	//点击订单时，获得所有商品分类和商品信息
	public CatProVO getCatProVO();
}
