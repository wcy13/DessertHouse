package edu.nju.desserthouse.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.desserthouse.dao.BaseDao;
import edu.nju.desserthouse.dao.ProductCategoryDao;
import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.model.Member;
import edu.nju.desserthouse.model.ProductCategory;

@Repository
public class ProductCategoryDaoImpl implements ProductCategoryDao{

	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public ProductCategory find(int id) {
		ProductCategory pc = (ProductCategory)baseDao.load(ProductCategory.class, id);
		return pc;
	}

	@Override
	public List<ProductCategory> getAllProductCategoryList() {
		@SuppressWarnings("unchecked")
		List<ProductCategory> list = baseDao.getAllList(ProductCategory.class);
		return list;
	}

	@Override
	public List<ProductCategory> getAllChildrenProductCategoryList(int ppcid) {
		String sql = "SELECT * FROM desserthouse.productcategory where ppcid="+ppcid;

		List<Object[]> objects = baseDao.querySQL(sql);
		List<ProductCategory> list = new ArrayList<ProductCategory>();
		for (Object[] obj : objects) {
			ProductCategory d = new ProductCategory();
			d.setPcid((int) obj[0]);
			d.setPcname((String) obj[1]);
			d.setPpcid((int) obj[2]);
			list.add(d);
		}
		return list;
	}

	@Override
	public ProductCategory findParent(int pcid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductCategory> getAllParentProductCategoryList() {
		@SuppressWarnings("unchecked")
		List<ProductCategory> list = baseDao.getAllList(ProductCategory.class);
		return list;
	}
	
}