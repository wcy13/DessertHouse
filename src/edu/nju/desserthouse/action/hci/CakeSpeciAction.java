package edu.nju.desserthouse.action.hci;

import java.util.Enumeration;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.Cakediscription;
import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.model.ProductCategory;
import edu.nju.desserthouse.service.DessertService;
import edu.nju.desserthouse.service.ProductCategoryService;

public class CakeSpeciAction extends BaseAction{
	@Autowired
	private DessertService dessertService;
	private ProductCategoryService productCategoryService;

	public DessertService getDessertService() {
		return dessertService;
	} 

	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
	}

	public ProductCategoryService getProductCategoryService() {
		return productCategoryService;
	}

	public void setProductCategoryService(ProductCategoryService productCategoryService) {
		this.productCategoryService = productCategoryService;
	}
	@Override
	public String execute() throws Exception {
		Enumeration<String> es = request.getParameterNames();
		String str = "";
		if(es.hasMoreElements()){
			str = es.nextElement();
		}
		System.out.println("str:"+str);
		int did = Integer.valueOf(str);
		Dessert cake = dessertService.findDessert(did);
		System.out.println("did:"+did);
		request.setAttribute("cake", cake);
		ProductCategory pc =  productCategoryService.find(cake.getPcid());
		request.setAttribute("pc", pc);
		Cakediscription cd = dessertService.getCakediscription(did);
		request.setAttribute("cd", cd);
		return "cakeSpeci";
	}
	
}
