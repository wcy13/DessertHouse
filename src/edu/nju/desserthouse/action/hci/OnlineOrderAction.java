package edu.nju.desserthouse.action.hci;

import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.hci.CatProVO;
import edu.nju.desserthouse.model.hci.ShopListVO;
import edu.nju.desserthouse.service.ShopService;

public class OnlineOrderAction extends BaseAction{
	@Autowired
	private ShopService shopService;//负责调用商品和商品分类的dao进行展示

	public ShopService getShopService() {
		return shopService;
	}

	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}

	@Override
	public String execute() throws Exception {
		Enumeration<String> es = request.getParameterNames();
		String str = es.nextElement();
		String[]arr = str.split("-");
		HttpSession session = request.getSession(true);
		session.setAttribute("sid", arr[0]);
		session.setAttribute("disname", arr[1]);
		session.setAttribute("sname", arr[2]);
		ShopListVO slvo = shopService.getShopListVO();
		request.setAttribute("slvo", slvo);
		CatProVO cpvo = shopService.getCatProVO();
		request.setAttribute("cpvo", cpvo);
		return "onlineOrder";
	}
	
}
