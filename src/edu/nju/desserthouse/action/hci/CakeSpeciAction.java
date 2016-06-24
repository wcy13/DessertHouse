package edu.nju.desserthouse.action.hci;

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
	private int did = 0;//…Ã∆∑±‡∫≈

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

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	@Override
	public String execute() throws Exception {
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
