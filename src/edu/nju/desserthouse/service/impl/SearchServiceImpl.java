package edu.nju.desserthouse.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.dao.DessertDao;
import edu.nju.desserthouse.dao.ShopDao;
import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.model.Shop;
import edu.nju.desserthouse.model.hci.SearchVO;
import edu.nju.desserthouse.service.SearchService;

public class SearchServiceImpl implements SearchService{
	@Autowired
	private DessertDao dessertDao;
	private ShopDao shopDao;
	
	public DessertDao getDessertDao() {
		return dessertDao;
	}

	public void setDessertDao(DessertDao dessertDao) {
		this.dessertDao = dessertDao;
	}

	public ShopDao getShopDao() {
		return shopDao;
	}

	public void setShopDao(ShopDao shopDao) {
		this.shopDao = shopDao;
	}

	@Override
	public SearchVO getSearchResult(String searchContent) {
		List<Dessert> dList = dessertDao.getAllDessertList();
		List<Shop> sList = shopDao.getAllShopList();
		
		List<Dessert> dessertList = new ArrayList<Dessert>();
		List<Shop> shopList = new ArrayList<Shop>();
		
		if(searchContent==null||searchContent.length()==0){
			SearchVO svo = new SearchVO(dessertList,shopList);
			return svo;
		}
		
		for(Dessert d :dList){
			if(d.getName().contains(searchContent)){
				dessertList.add(d);
			}
		}
		for(Shop s:sList){
			if(s.getSname().contains(searchContent)||s.getAddress().contains(searchContent)){
				shopList.add(s);
			}
		}
		SearchVO svo = new SearchVO(dessertList,shopList);
		return svo;
	}

}
