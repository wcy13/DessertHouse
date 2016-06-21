package edu.nju.desserthouse.action.hci;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.hci.CakeVO;
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
		//获得所有蛋糕分类，每个分类对应的蛋糕
		CakeVO cvo = dessertService.getCakeVO();
		request.setAttribute("cvo", cvo);
		return "cake";
	}
	
}
