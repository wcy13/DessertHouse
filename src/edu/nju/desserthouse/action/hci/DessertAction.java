package edu.nju.desserthouse.action.hci;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.service.DessertService;

public class DessertAction  extends BaseAction{
	@Autowired
	private DessertService dessertService;
	public DessertService getDessertService() {
		return dessertService;
	} 

	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
	}
	@Override
	public String execute() throws Exception {
		List<Dessert> dessertList = dessertService.getCategoryRelatedDesserts(3);
		request.setAttribute("dessertList", dessertList);
		return "dessert";
	}
	
}
