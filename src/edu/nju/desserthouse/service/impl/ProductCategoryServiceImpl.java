package edu.nju.desserthouse.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import edu.nju.desserthouse.dao.ProductCategoryDao;
import edu.nju.desserthouse.model.ProductCategory;
import edu.nju.desserthouse.service.ProductCategoryService;

public class ProductCategoryServiceImpl implements ProductCategoryService{
	@Autowired
	private ProductCategoryDao productCategoryDao;
	
	public ProductCategoryDao getProductCategoryDao() {
		return productCategoryDao;
	}

	public void setProductCategoryDao(ProductCategoryDao productCategoryDao) {
		this.productCategoryDao = productCategoryDao;
	}

	@Override
	public ProductCategory find(int pcid) {
		return productCategoryDao.find(pcid);
	}

}
