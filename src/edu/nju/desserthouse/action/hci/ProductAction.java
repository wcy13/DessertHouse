package edu.nju.desserthouse.action.hci;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.service.DessertService;
/**
 * 商品首页
 */
public class ProductAction extends BaseAction{
	@Autowired
	private DessertService dessertService;//负责调用商品和商品分类的dao进行展示
	
	public DessertService getDessertService() {
		return dessertService;
	}

	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
	}

	@Override
	public String execute() throws Exception {
		return "product";
	}
	
}
