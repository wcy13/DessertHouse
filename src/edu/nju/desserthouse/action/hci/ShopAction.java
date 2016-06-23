package edu.nju.desserthouse.action.hci;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.Shop;
import edu.nju.desserthouse.model.hci.ShopListVO;
import edu.nju.desserthouse.service.ShopService;

public class ShopAction extends BaseAction{
	@Autowired
	private ShopService shopService;
	private int disid = 0;

	public ShopService getShopService() {
		return shopService;
	}

	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}

	public int getDisid() {
		return disid;
	}

	public void setDisid(int disid) {
		this.disid = disid;
	}


	@Override
	public String execute() throws Exception {
		ShopListVO slvo = shopService.getShopListVO();
		List<Shop> sList = new ArrayList<Shop>();
		if(disid==0){
			sList = slvo.shopList;
		}else{
			sList = slvo.dpMap.get(disid);
		}
		request.setAttribute("disList", slvo.districtList);
		request.setAttribute("sList", sList);
		request.setAttribute("disid", disid);
		return "shop";
	}
	
}
