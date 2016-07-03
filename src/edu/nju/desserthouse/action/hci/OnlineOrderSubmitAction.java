package edu.nju.desserthouse.action.hci;

import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import edu.nju.desserthouse.action.BaseAction;
import edu.nju.desserthouse.model.Member;
import edu.nju.desserthouse.model.OrderDetail;
import edu.nju.desserthouse.model.hci.DessertItem;
import edu.nju.desserthouse.model.hci.ShopItem;
import edu.nju.desserthouse.model.hci.ShoppingCart;
import edu.nju.desserthouse.service.MemberService;
import edu.nju.desserthouse.service.OrderService;

public class OnlineOrderSubmitAction extends BaseAction {
	@Autowired
	private MemberService memberService;
	private OrderService orderService;
	private String seatNum;
	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}



	public String getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}

	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}


	@Override
	public String execute() throws Exception {
		HttpSession session = request.getSession(true);
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		Member m = (Member) session.getAttribute("memberInfo");
		//在线点单 order保存 并获得oid
		int sid =  Integer.parseInt((String)session.getAttribute("sid"));
		double total = cart.getTotalPrices();
		double realTotal = m.getDiscount()*0.1*total;
		realTotal = (double)Math.round(realTotal);
		int cid = m.getCid();
		String dm = String.valueOf(m.getLevel())+"级会员，享受商品"+String.valueOf(m.getDiscount())+"折优惠";
		int oid = orderService.saveOnlineOrder(sid, total, realTotal, cid, dm, seatNum);
		Map<String,ShopItem> map = cart.getMap();
		for (Entry<String,ShopItem> entry : map.entrySet()){
			ShopItem  sitem= entry.getValue();
			DessertItem ditem = sitem.getDessert();
			OrderDetail od = new OrderDetail();
			od.setDid(ditem.getDid());
			od.setOid(oid);
			od.setAmount(sitem.getCount());
			od.setPrice(ditem.getPrice());
			od.setDiscription("");
			/*
			 * 在线点餐不需要
			if(ditem.isCake()){
				//p j m z
			}else{
				od.setPrice(ditem.getPrice());
			}
			*/
			orderService.save(od);
		}
		cart.remove();
		session.setAttribute("cart", cart);
		return "index";

	}
}
