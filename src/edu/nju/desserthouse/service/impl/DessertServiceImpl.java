package edu.nju.desserthouse.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.dao.CakediscriptionDao;
import edu.nju.desserthouse.dao.DessertDao;
import edu.nju.desserthouse.dao.ProductCategoryDao;
import edu.nju.desserthouse.model.Cakediscription;
import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.model.ProductCategory;
import edu.nju.desserthouse.model.hci.CakeVO;
import edu.nju.desserthouse.model.hci.CategoryShowVO;
import edu.nju.desserthouse.service.DessertService;

public class DessertServiceImpl implements DessertService{
	@Autowired
	private DessertDao dessertDao;
	private ProductCategoryDao productCategoryDao;
	private CakediscriptionDao cakediscriptionDao;
	
	public DessertDao getDessertDao() {
		return dessertDao;
	}

	public void setDessertDao(DessertDao dessertDao) {
		this.dessertDao = dessertDao;
	}

	public ProductCategoryDao getProductCategoryDao() {
		return productCategoryDao;
	}

	public void setProductCategoryDao(ProductCategoryDao productCategoryDao) {
		this.productCategoryDao = productCategoryDao;
	}

	public CakediscriptionDao getCakediscriptionDao() {
		return cakediscriptionDao;
	}

	public void setCakediscriptionDao(CakediscriptionDao cakediscriptionDao) {
		this.cakediscriptionDao = cakediscriptionDao;
	}

	@Override
	public void createDessert(Dessert dessert) {
		dessertDao.save(dessert);
	}

	@Override
	public void deleteDessert(int id) {
		dessertDao.delete(id);
	}

	@Override
	public Dessert findDessert(int id) {
		return dessertDao.find(id);
	}

	@Override
	public void updateByDessertid(Dessert dessert) {
		dessertDao.updateByDessertId(dessert);
	}

	@Override
	public List<Dessert> getAllDessertList() {
		return dessertDao.getAllDessertList();
	}
	
	/***************************HCIœ‡πÿ***********************************/
	@Override
	public CategoryShowVO getAllCategory() {
		List<ProductCategory> list = productCategoryDao.getAllProductCategoryList();
		List<ProductCategory> list1 = new ArrayList<ProductCategory> ();//top
		List<ProductCategory> list2 = new ArrayList<ProductCategory> ();//cake
		for(ProductCategory pc:list){
			if(pc.getPpcid()==2){
				list2.add(pc);
				System.out.println(pc.getPcname());
			}else if(!(pc.getPcid()==2)){
				list1.add(pc);
				System.out.println(pc.getPcname());
			}
		}
		CategoryShowVO csvo = new CategoryShowVO();
		csvo.topCategoryList = list1;
		csvo.cakeCategoryList = list2;
		return csvo;
	}

	@Override
	public List<Dessert> getCategoryRelatedDesserts(int pcid) {
		
		return dessertDao.getCategoryRelatedDesserts(pcid);
	}

	@Override
	public CakeVO getCakeVO() {
		List<ProductCategory> pcList = productCategoryDao.getAllChildrenProductCategoryList(2);
		HashMap<Integer,List<Dessert>> pdMap = new HashMap<Integer,List<Dessert>>();
		for(ProductCategory pc:pcList){
			List<Dessert> l = dessertDao.getCategoryRelatedDesserts(pc.getPcid());
			pdMap.put(pc.getPcid(), l);
		}
		CakeVO cvo = new CakeVO(pcList,pdMap);
		return cvo;
	}

	@Override
	public Cakediscription getCakediscription(int did) {
		return cakediscriptionDao.find(did);
	}

}
