package edu.nju.desserthouse.action.hci;
import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.hci.ShopListVO;
import edu.nju.desserthouse.service.ShopService;

public class CheckoutAction extends BaseAction{
	@Autowired
	private ShopService shopService;
	public ShopService getShopService() {
		return shopService;
	}

	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}
	@Override
	public String execute() throws Exception {
		ShopListVO slvo = shopService.getShopListVO();
		request.setAttribute("slvo", slvo);
		return "checkout";
	}
	
}
