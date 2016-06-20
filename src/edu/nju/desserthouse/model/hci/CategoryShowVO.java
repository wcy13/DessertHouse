package edu.nju.desserthouse.model.hci;

import java.util.List;

import edu.nju.desserthouse.model.ProductCategory;

/**
 * 商品分类查看，分为两部分
 * 一部分是除了蛋糕之外的一级分类
 * 另一部分是蛋糕分类下的二级分类，故在展示的时候，最后先写上蛋糕 再在其下显示蛋糕下的二级分类
 * @author Administrator
 *
 */
public class CategoryShowVO {
	public List<ProductCategory> topCategoryList;
	public List<ProductCategory> cakeCategoryList;
	
	public CategoryShowVO(){}
	public CategoryShowVO(List<ProductCategory> topCategoryList, List<ProductCategory> cakeCategoryList) {
		super();
		this.topCategoryList = topCategoryList;
		this.cakeCategoryList = cakeCategoryList;
	}
	
	
}
