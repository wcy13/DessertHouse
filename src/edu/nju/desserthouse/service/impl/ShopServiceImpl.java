package edu.nju.desserthouse.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.dao.DessertDao;
import edu.nju.desserthouse.dao.DistrictDao;
import edu.nju.desserthouse.dao.ProductCategoryDao;
import edu.nju.desserthouse.dao.ShopDao;
import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.model.District;
import edu.nju.desserthouse.model.ProductCategory;
import edu.nju.desserthouse.model.Shop;
import edu.nju.desserthouse.model.hci.CatProVO;
import edu.nju.desserthouse.model.hci.ShopListVO;
import edu.nju.desserthouse.service.ShopService;

public class ShopServiceImpl implements ShopService{
	@Autowired
	private ShopDao  shopDao;
	private DistrictDao districtDao;
	private ProductCategoryDao productCategoryDao;
	private DessertDao dessertDao;
	
	public ShopDao getShopDao() {
		return shopDao;
	}

	public void setShopDao(ShopDao shopDao) {
		this.shopDao = shopDao;
	}

	public DistrictDao getDistrictDao() {
		return districtDao;
	}

	public void setDistrictDao(DistrictDao districtDao) {
		this.districtDao = districtDao;
	}

	public ProductCategoryDao getProductCategoryDao() {
		return productCategoryDao;
	}

	public void setProductCategoryDao(ProductCategoryDao productCategoryDao) {
		this.productCategoryDao = productCategoryDao;
	}

	public DessertDao getDessertDao() {
		return dessertDao;
	}

	public void setDessertDao(DessertDao dessertDao) {
		this.dessertDao = dessertDao;
	}

	@Override
	public void createShop(Shop shop) {
		shopDao.save(shop);
	}

	@Override
	public void deleteShop(int id) {
		shopDao.delete(id);
	}

	@Override
	public Shop findShop(int id) {
		return shopDao.find(id);
	}

	@Override
	public void updateByShopid(Shop shop) {
		shopDao.updateByShopid(shop);
	}

	@Override
	public List<Shop> getAllShopList() {
		return shopDao.getAllShopList();
	}

	@Override
	public ShopListVO getShopListVO() {
		List<Shop> shopList = shopDao.getAllShopList();
		List<District> districtList = districtDao.getAllDistrictList();
		HashMap<Integer,List<Shop>> dpMap = new HashMap<Integer,List<Shop>>();
		for (District s : districtList) {
			List<Shop> l = new ArrayList<Shop>();
			dpMap.put(s.getDisid(), l);
		}
		for(Shop s:shopList){
			dpMap.get(s.getDisid()).add(s);
		}
		ShopListVO slvo = new ShopListVO(shopList,districtList,dpMap);
		return slvo;
	}

	@Override
	public CatProVO getCatProVO() {
		List<ProductCategory> productCategoryList = productCategoryDao.getAllProductCategoryList();
		List<ProductCategory> pcList = new ArrayList<ProductCategory>();
		List<Dessert> dessertList = dessertDao.getAllDessertListWithoutCake();
		HashMap<Integer,List<Dessert>> cpMap = new HashMap<Integer,List<Dessert>>();
		for (ProductCategory d : productCategoryList) {
			if((d.getPcid()!=2)||(d.getPpcid()!=2)){
				pcList.add(d);
				List<Dessert> l = new ArrayList<Dessert>();
				cpMap.put(d.getPcid(), l);
			}
		}
		for(Dessert d:dessertList){
			if(cpMap.containsKey(d.getPcid())){
				cpMap.get(d.getPcid()).add(d);
			}
			
		}
		CatProVO cpvo = new CatProVO(pcList,dessertList,cpMap);
		return cpvo;
	}

}
