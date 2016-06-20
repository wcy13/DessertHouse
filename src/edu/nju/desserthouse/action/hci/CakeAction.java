package edu.nju.desserthouse.action.hci;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.Dessert;
import edu.nju.desserthouse.service.DessertService;

public class CakeAction extends BaseAction{
	@Autowired
	private DessertService dessertService;
	private int pcid = 0;//商品分类编号

	public DessertService getDessertService() {
		return dessertService;
	} 

	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
	}
	public int getPcid() {
		return pcid;
	}

	public void setPcid(int pcid) {
		this.pcid = pcid;
	}

	@Override
	public String execute() throws Exception {
		List<Dessert> dessertList = dessertService.getCategoryRelatedDesserts(pcid);
		System.out.println("pcid:"+pcid);
		request.setAttribute("dessertList", dessertList);
		return "cake";
	}
	
}
